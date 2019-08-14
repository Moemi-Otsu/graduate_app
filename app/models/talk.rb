class Talk < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { in: 1..255 }
  validates :content, presence: true, uniqueness: true
end
