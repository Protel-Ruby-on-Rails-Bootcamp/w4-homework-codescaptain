class Post < ApplicationRecord

	belongs_to :user
	has_many :comments

	scope :availables, -> {where(visible: true)}
	scope :ordered_by_created_at, -> {order(created_at: :desc)}

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
