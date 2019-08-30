require 'faker'
FactoryBot.define do

  factory :category do
    name { 'カテゴリ1' }
    association :talk, factory: :talk
  end

end