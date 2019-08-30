require 'faker'
FactoryBot.define do

  factory :comment do
    content { Faker::Quote.famous_last_words }
  end

end