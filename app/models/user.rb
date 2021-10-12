class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true       
  validates :nickname, presence: true, length: {minimum: 5, maximum: 50 }
  has_many :posts
  has_many :comments
end
