class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :text
    validates :date
    validates :study_time
  end
  validates :study_time, format: { with: /\A[0-9]+\z/ }
end