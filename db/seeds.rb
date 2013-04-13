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
            portions: 25)

Gift.create(title: 'Flight',
            description: 'American Airlines',
            amount: 1600.00,
            portions: 10)

Gift.create(title: 'Scuba Diving',
            description: 'We wana scuba dive while on our honeymoon',
            amount: 1600.00,
            portions: 25)

Gift.create(title: 'Dream Home',
            description: 'We want to buy our dream home',
            amount: 1000000.00,
            portions: 1000000)

User.destroy_all
User.create(first:'Tatum',
            last: 'Szymczak',
            email: 'tatum@ashlandstudios.com')