class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_commit :update_comments_counter_for_post
  validates :text, presence: true, length: { minimum: 1 }
  def update_comments_counter_for_post
    post.update(comments_counter: post.comments.count) if post.present?
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at])
  end
end
