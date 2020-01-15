class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
