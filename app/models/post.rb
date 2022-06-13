class Post < ApplicationRecord
	belongs_to :user, foreign_key: 'author_id'
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	after_create :update_counter_for_user

	def update_counter_for_user
		user.update(posts_counter:user.posts.count)
	end
	def recent_comments
		 comments.order('created_at desc').limit(5)
	end		
end
