# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.create!(
  title: 'Away We Go',
  director: 'Sam Mendes',
  runtime_in_minutes: 98,
  description: 'A couple who is expecting their first child travel around the U.S. in order to find a perfect place to start their family. Along the way, they have misadventures and find fresh connections with an assortment of relatives and old friends who just might help them discover "home" on their own terms for the first time.',
  poster: '',
  release_date: Date.new(2009, 6, 26)
  )