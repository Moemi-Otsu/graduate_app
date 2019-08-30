require 'faker'
FactoryBot.define do

  factory :talk do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    complete { false }
    # user_id {}
    # likes_count {}
    association :user, factory: :user

    # after(:create) do |talk|
    #   create_list(:category, 3, talks: [talk])
    # end
  end

end