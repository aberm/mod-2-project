# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Boss.destroy_all
Tasker.destroy_all

3.times do |index|
  Boss.create!(name: Faker::Name.name,
                email: Faker::Internet.email,
                username: Faker::Internet.username(6),
                city: Faker::Address.state,
               )
  end

	3.times do |index|
	  Tasker.create!(name: Faker::Name.name,
	                email: Faker::Internet.email,
	                username: Faker::Internet.username(6),
	                city: Faker::Address.state,
	                bio: Faker::Lorem.paragraph(4),
	                vehicle: Faker::Boolean.boolean(0.8)
	               )
	  end
