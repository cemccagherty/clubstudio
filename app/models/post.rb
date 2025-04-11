class Post < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  has_many_attached :media

  validates :title, presence: true
  validates :title, length: { maximum: 30 }
end
