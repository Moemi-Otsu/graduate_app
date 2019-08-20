class Talk < ApplicationRecord
  belongs_to :user
  has_many :talk_categories, dependent: :destroy
  has_many :categories, through: :talk_categories
  has_many :comments, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { in: 1..255 }
  validates :content, presence: true, uniqueness: true
end