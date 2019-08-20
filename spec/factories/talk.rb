FactoryBot.define do

  factory :talk do
    title { 'トークタイトルfactoryのA' }
    content { 'トークコンテンツfactoryのA' }
    complete { false }
  end

  factory :second_talk, class: Talk do
    title { 'トークタイトルfactoryのB' }
    content { 'トークコンテンツfactoryのB' }
    complete { false }
  end

end