class Category < ApplicationRecord
  has_many :talk_categories, dependent: :destroy
  has_many :talks, dependent: :destroy, through: :talk_categories
  validates :name, presence: true, uniqueness: true
end
