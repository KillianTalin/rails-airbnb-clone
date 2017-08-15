# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Chalet.destroy_all

puts 'Creating chalets...'
chalets_attributes = [
  {
    name:            "Refuge des Cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           50,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls: [https://lh3.googleusercontent.com/-MbVZ5BVlaeA/WAInJcEfwCI/AAAAAAAAs5I/ywJ6rZR9Si4bUEvjuh3zxzEHkpqFISyZQCLIB/w645-h320-k-no/]

  },
  {
    name:            "Refuge du Goûter",
    capacity:        120,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        3835,
    rating:          4,
    price:           60,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls: [https://www.chamonix.net/sites/default/files/refuge-du-gouter.jpg?itok=uog9XUVO]
  },
  {
    name:            "Refuge de Tête Rousse",
    capacity:        74,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        3167,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls: [http://magdescimes.com/wp-content/uploads/2012/07/25156292452_10151047309892453.jpg]

  },
  {
    name:            "Refuge Valot",
    capacity:        130,
    city:            "Saint-Gervais-les-Bains",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        4365,
    rating:          2,
    price:           20,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls: [http://www.refuges-montagne.info/images/vallot-00.jpg]
  },
  {
    name:            "Refuge Robert-Blanc",
    capacity:        130,
    city:            "Bourg Saint-Maurice",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        4365,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls:      [http://www.refuges-montagne.info/images/vallot-00.jpg]
  },
  {
    name:            "Refuge d'Argentière'",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "Massif du Mont-Blanc",
    latitude:        455223,
    longitude:       065308,
    altitude:        2771,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
    photo_urls: [http://www.refuges-montagne.info/images/argentiere-00.jpg]
  },



]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'

