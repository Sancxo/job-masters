# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

weapons_list = [
  ["Sword", "offensive", 3],
  ["Wood stick", "offensive", 1],
  ["Axe", "offensive", 5],
  ["Big shield", "defensive", 5],
  ["Wooden shield", "defensive", 3]
]

weapons_list.each do |name, weapon_type, bonus| 
  Weapon.create(name: name, weapon_type: weapon_type, bonus: bonus)
end