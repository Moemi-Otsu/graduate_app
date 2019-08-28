# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
20.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  role = "member"
  User.create!(name: name,
               email: email,
               role: role,
               password: password,
               password_confirmation: password,
               )
end

# Profile
user_id_array = User.pluck(:id).sort_by{rand}
age = 20..60
age_array = age.sort_by{rand}

20.times do |n|
  age = age_array[n]
  image = nil
  working_company = Faker::Company.name
  previous_company = Faker::Company.name
  length_worked = "half_year"
  address = Faker::Address.full_address
  area = "kanto"
  occupation = "sales"
  industry = "internet_advertising"
  user_id = user_id_array[n]
  Profile.create!(age: age,
                  image: image,
                  working_company: working_company,
                  previous_company: previous_company,
                  length_worked: length_worked,
                  address: address,
                  area: area,
                  occupation: occupation,
                  industry: industry,
                  user_id: user_id,
               )
end

# Talk
num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
20.times do |n|
  title = Faker::Quote.famous_last_words + num[n].to_s
  content = Faker::Quotes::Shakespeare.hamlet_quote + num[n].to_s
  user_id = user_id_array[n]
  Talk.create!(title: title,
               content: content,
               user_id: user_id,
               )
end
