class Project < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :title, :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :title, length: { maximum: 30 }
end
