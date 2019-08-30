require 'faker'
FactoryBot.define do

  factory :profile do
    age { '26' }
    image { nil }
    working_company { 'ジャパンワークス株式会社' }
    previous_company { '株式会社パストワークス' }
    length_worked { 'half_year' }
    address { '東京都世田谷区代沢2-6-12' }
    area { 'kanto' }
    occupation { 'accounting' }
    industry { 'internet_advertising' }
    # user_id { user.id }
    association :user, factory: :user
  end

end