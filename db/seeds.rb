# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

4.times do
  User.create!(
    username: FFaker::Internet.user_name + [*('a'..'z')].sample(5).join,
    email: FFaker::Internet.email,
    avatar: FFaker::Avatar.image,
    password: FFaker::Internet.password
  )
end
