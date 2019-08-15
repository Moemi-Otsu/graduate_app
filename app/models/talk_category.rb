class TalkCategory < ApplicationRecord
  belongs_to :talk
  belongs_to :category
end
