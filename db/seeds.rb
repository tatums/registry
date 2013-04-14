# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Gift.destroy_all
Gift.create(title: 'Hotel',
            description: 'Bora Borra here we come.',
            amount: 2200.00,
            portions: 25,
            image: File.open( "#{Rails.root}/public/seed_photos/motel2.jpg"))

Gift.create(title: 'Flight',
            description: 'American Airlines',
            amount: 1600.00,
            portions: 10,
            image: File.open( "#{Rails.root}/public/seed_photos/airplane.jpg"))

Gift.create(title: 'Beach',
            description: 'We wana hanout at the beech on our honeymoon',
            amount: 1600.00,
            portions: 25,
            image: File.open( "#{Rails.root}/public/seed_photos/sweet_bird_of_youth.jpg"))


Gift.create(title: 'Dream Home',
            description: 'We want to buy our dream home',
            amount: 1000000.00,
            portions: 1000000,
            image: File.open( "#{Rails.root}/public/seed_photos/home.jpg"))

# User.destroy_all
# User.create(first:'Tatum',
#             last: 'Szymczak',
#             email: 'tatum@ashlandstudios.com')