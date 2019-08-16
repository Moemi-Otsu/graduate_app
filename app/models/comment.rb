class Comment < ApplicationRecord
  belongs_to :talk
  validates :content, length: { minimum: 1 }
end
