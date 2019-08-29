FactoryBot.define do

  factory :user do
    email { 'zzz@mail.com' }
    password { 'zzzzzz' }
    password_confirmation { 'zzzzzz' }
    name { 'zzz' }
    role { 'admin' }
  end

  factory :second_user, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    name { Faker::Name.name }
    role { 'member' }
  end

  factory :third_user, class: User do
    # ここに処理が入ります。
  end

end