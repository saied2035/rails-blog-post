class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_commit :update_counter_for_user

  validates :title, presence: true, length: { minimum: 4, maximum: 250 }
  validates :comments_counter, presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def update_counter_for_user
    puts author.id
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.includes(:author).order('created_at desc').limit(5)
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at])
  end
end
