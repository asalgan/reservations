# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurant = Restaurant.create(capacity: 24)

# Create 10 spots: 5 tables for 2 people
5.times do
  Table.create(restaurant: restaurant, table_type: 0)
end

# Create 8 spots: 2 tables for 4 people
2.times do
  Table.create(restaurant: restaurant, table_type: 1)
end

# Create 6 spots: 1 table for 6 people
1.times do
  Table.create(restaurant: restaurant, table_type: 2)
end
