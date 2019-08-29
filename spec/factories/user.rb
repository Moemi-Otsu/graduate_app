FactoryBot.define do

  factory :user do
    email { 'zzz@mail.com' }
    encrypted_password { 'zzzzzz' }
    name { 'zzz' }
    role { 'admin' }
  end

  factory :second_user, class: User do
    email { Faker::Internet.email }
    encrypted_password { 'password' }
    name { Faker::Name.name }
    role { 'member' }
  end

  factory :third_user, class: User do
  end

end