class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :follwed, class_name: 'User'
end
