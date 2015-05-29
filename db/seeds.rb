# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  Post.create(
          title:   Faker::Lorem.sentence( rand(3..10) ),
          description: Faker::Lorem.sentence( rand(40..100) ),
          user_id:  rand(1..20)
  )
end
