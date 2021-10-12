class Post < ApplicationRecord

	belongs_to :user
	has_many :comments
	scope :availables, -> {where(visible: true)}
	validates :title, presence: true
	validates :content, presence: true

	def post_status
      if visible
       '✅'
      else
       '⭕'
      end
  end
end
