class Comment < ApplicationRecord
  belongs_to :talk
  belongs_to :user
  validates :content, length: { minimum: 1 }
end
