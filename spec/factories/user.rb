FactoryBot.define do

  factory :user do
    email { 'zzz@mail.com' }
    encrypted_password { 'zzzzzz' }
    name { 'zzz' }
  end

  factory :second_user, class: User do
  end

  factory :third_user, class: User do
  end

end