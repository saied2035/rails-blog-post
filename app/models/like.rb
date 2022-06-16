class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_commit :update_likes_counter_for_user, on: :create
  def update_likes_counter_for_user
    post.update(likes_counter: post.likes.count)
  end
end
