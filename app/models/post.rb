class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_commit :update_counter_for_user, on: :create

  def update_counter_for_user
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.includes(:author).order('created_at desc').limit(5)
  end
end
