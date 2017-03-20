# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'addressable/uri'

3.times do
  fake_user = User.create!(
    username: FFaker::Internet.user_name + [*('a'..'z')].sample(5).join,
    email: FFaker::Internet.email,
    avatar: FFaker::Avatar.image,
    password: FFaker::Internet.password
  )
  3.times do
    fake_gallery = Gallery.create!(
      title: FFaker::Book.title,
      description: FFaker::Book.description,
      user: fake_user
    )
    3.times do
      fake_image = Image.new(
        title: FFaker::CheesyLingo.title,
        caption: FFaker::CheesyLingo.sentence
      )
      fake_image.file_remote_url = Unsplash::Photo.random.urls.regular
      fake_image.save!
      fake_gallery.images << fake_image
      fake_gallery.save!
    end
  end
end
