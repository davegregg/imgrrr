# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

3.times do
  fake_user = User.create!(
    username: FFaker::Internet.user_name + [*('a'..'z')].sample(5).join,
    email: FFaker::Internet.email,
    avatar: FFaker::Avatar.image,
    password: FFaker::Internet.password
  )
  3.times do
    Gallery.create!(
      title: FFaker::Book.title,
      description: FFaker::Book.description
    )
    3.times do
      Image.create!(
        title: FFaker::CheesyLingo.title,
        description: FFaker::sentence,
        #seeding????
        #Unsplash::Photo.random
      )
    end
  end
end
