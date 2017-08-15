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
restaurants_attributes = [
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },
  {
    name:            "Refuge des cosmiques",
    capacity:        130,
    city:            "Chamonix-Mont-Blanc",
    location:        "",
    latitude:        455223,
    longitude:       065308,
    altitude:        3613,
    rating:          3,
    price:           100,
    cb_accepted:     true,
    opening_date:    15/06/17,
    closing_date:    15/09/17,
    last_renovation: 10/05/14,
  },



]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'

