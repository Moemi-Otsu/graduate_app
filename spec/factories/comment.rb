require 'faker'
FactoryBot.define do

  factory :comment do
    content { Faker::Quote.famous_last_words }
    association :talk, factory: :talk
    association :user, factory: :user
  end

end