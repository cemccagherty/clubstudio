class Post < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 30 }
end
