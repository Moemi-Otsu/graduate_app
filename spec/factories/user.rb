require 'faker'
FactoryBot.define do

  factory :user do
    email { 'zzz@mail.com' }
    password { 'zzzzzz' }
    password_confirmation { 'zzzzzz' }
    name { 'zzz' }
    role { 'admin' }

    after(:create) do |user|
      create_list(:profile, 1, user: user)
    end

    after(:create) do |user|
      create_list(:talk, 1, user: user)
    end

    # after(:create) do |user|
    #   create_list(:comment, 1, user: user)
    # end
  end

  factory :second_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    name { Faker::Name.name }
    role { 'member' }
  end

end