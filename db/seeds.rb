Boss.destroy_all
Tasker.destroy_all
Task.destroy_all

categories = [ "Assembly", "Carpentry", "Cleaning", "Decoration", "Delivery",
    "Electrical", "Errands", "Event-Planning", "Gardening", "Heavy Lifting",
    "Home Improvement", "Installation", "Moving", "Organization", "Painting",
    "Personal Assistant", "Plumbing", "Repairs", "Shopping", "Waiting-in-Line"]

10.times do |index|
  Boss.create!(name: Faker::Name.name,
                email: Faker::Internet.email,
                username: Faker::Internet.username(6),
                city: Faker::Address.state,
                password:'1234',
               )
  end
#
	10.times do |index|
	  Tasker.create!(name: Faker::Name.name,
	                email: Faker::Internet.email,
	                username: Faker::Internet.username(6),
	                city: Faker::Address.state,
	                bio: Faker::Lorem.paragraph(4),
	                vehicle: Faker::Boolean.boolean(0.8),
                  password:'1234',
	               )
	  end
	10.times do |index|
	  Task.create!(city: Faker::Address.state,
	                description: Faker::Lorem.paragraph(5),
	                category: categories.sample,
	                time: Faker::Time.forward(23, :morning),
	                boss_id: Faker::Number.between(1, 10),
	                tasker_id: Faker::Number.between(1, 10),
									minutes: Faker::Number.between(1, 6) * 60,
	                vehicle: Faker::Boolean.boolean(0.8),
	                completed: true,
									price_rate: Faker::Number.between(15, 50) * 100,
									rating: Faker::Number.between(1, 5),
									review: Faker::Lorem.paragraph(1),
									boss_rating: Faker::Number.between(1, 5)
	               )
	  end
    10.times do |index|
  	  Task.create!(city: Faker::Address.state,
  	                description: Faker::Lorem.paragraph(5),
  	                category: categories.sample,
  	                time: Faker::Time.forward(23, :morning),
  	                boss_id: Faker::Number.between(1, 10),
  									minutes: Faker::Number.between(1, 6) * 60,
  	                vehicle: Faker::Boolean.boolean(0.5),
  	                completed: false,
  									price_rate: Faker::Number.between(15, 50) * 100
  	               )
  	  end

# Boss.create(name: "john f", email: "john5@gmail.com", username: "john5", city: "Brooklyn")
# Boss.create(name: "dave s", email: "dave55@gmail.com", username: "dave55", city: "Brooklyn")
# Boss.create(name: "mark z", email: "mark4@gmail.com", username: "mark4", city: "NY")
# Boss.create(name: "john l", email: "johnl123@gmail.com", username: "john123", city: "Manhattan")
# Boss.create(name: "robert", email: "robert@gmail.com", username: "robert", city: "Boston")
# Boss.create(name: "thomas", email: "thomas@gmail.com", username: "thomas", city: "Brooklyn")
#
# Tasker.create(name: "Sammy", email: "sammy@gmail.com", username: "sammy5", city: "Brooklyn", bio: "hi there how are you")
# Tasker.create(name: "John f k", email: "jfkjfk@gmail.com", username: "johnken", city: "Brooklyn", bio: "hi there how are you")
# Tasker.create(name: "johnno", email: "johnno@gmail.com", username: "johnno", city: "NYC", bio: "hi there how are you")
# Tasker.create(name: "Greg d", email: "gregreg@gmail.com", username: "greg321", city: "Brooklyn", bio: "hi there how are you", vehicle: true)
# Tasker.create(name: "Rick s", email: "ricksan@gmail.com", username: "therick", city: "Manhattan", bio: "hi there how are you")
# Tasker.create(name: "Walter", email: "walter6@gmail.com", username: "walter6", city: "Boston", bio: "hi there how are you")
# Tasker.create(name: "Nathan", email: "nathan1@gmail.com", username: "nathan111", city: "Boston", bio: "hi there how are you")
