class Like < ApplicationRecord
  belongs_to :user
  belongs_to :talk, counter_cache: :likes_count
end
