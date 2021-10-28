class Post < ApplicationRecord

	belongs_to :user
	has_many :comments

	scope :availables, -> { where(visible: true) }
	scope :ordered_by_created_at, -> { order(created_at: :desc) }
	scope :ordered_by_vote_count, -> { order(vote_count: :desc).limit(3) }

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
