class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	scope :accepteds, -> { where(accepted: true) }
	scope :denies, -> { where(accepted: false) }

	def self.accept_comment
		@old_comments = Comment.where('created_at < ? ', 2.days.ago).denies
		@old_comments.update(accepted: true)
	end

end
