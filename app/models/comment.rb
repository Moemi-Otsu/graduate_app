class Comment < ApplicationRecord
  belongs_to :talk, dependent: :destroy
end
