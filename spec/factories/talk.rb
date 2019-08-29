require 'faker'
FactoryBot.define do

  factory :talk do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    complete { false }
    # user_id {}
    # likes_count {}
  end

  factory :second_talk, class: Talk do
  end

end