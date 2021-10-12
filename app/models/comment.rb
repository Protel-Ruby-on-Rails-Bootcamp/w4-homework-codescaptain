class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user
    scope :accepteds, -> {where(accepted: true)}
end
