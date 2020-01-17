class Comment < ApplicationRecord
  belongs_to :user               #usersテーブルとのアソシエーション
  belongs_to :post               #postsテーブルとのアソシエーション
  counter_culture :post
  validates :text, presence: true
end
