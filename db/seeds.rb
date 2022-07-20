# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###################################
#Favorite.destroy_all

###################################

#Job.create([{ title: 'Caketoppers' } , { title: 'Clothes' }])
#puts "Seeding jobs..."
###################################

Image.create([{ image_link: "https://bit.ly/3orgpQ2", job_id: 1 } , { image_link: "https://bit.ly/3LdioRS", job_id: 1 }])
puts "Seeding images..."
###################################

puts "✅ Done seeding!"