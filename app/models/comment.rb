class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many_attached :media

  validates :content, presence: true
  validates :content, length: { maximum: 500 }
end
