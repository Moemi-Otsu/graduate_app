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
age = [1..100]
20.times do |n|
  age = 
  image = 
  working_company = 
  previous_company = 
  length_worked = 
  address = 
  area = 
  occupation = 
  industry = 
  user_id = user_id_array[n]
  Profile.create!(name: name,
               email: email,
               role: role,
               password: password,
               
               )
end