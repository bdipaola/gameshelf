# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Destroying all records
User.destroy_all
Game.destroy_all
Category.destroy_all
Friending.destroy_all
UserGame.destroy_all

#Creating seed users
User.create!(name: "Nic", username: "Nic", email: "nic@nic.com", password_hash:)
User.create!(name: "Christine", username: "Christine", email: "christine@christine.com", password_hash:)
User.create!(name: "John", username: "John", email: "john@john.com", password_hash:)
User.create!(name: "Ben", username: "Ben", email: "ben@ben.com", password_hash:)
User.create!(name: "Brockenbar", username: "Brockenbar", email: "Brockenbar@kot.com", password_hash:)
User.create!(name: "Space Penguin", username: "SpacePenguin", email: "SpacePenguin@kot.com", password_hash:)
User.create!(name: "Boogey Woogey", username: "BoogeyWoogey", email: "BoogeyWoogey@kot.com", password_hash:)
User.create!(name: "Pumpkin Jack", username: "Pumpkin Jack", email: "PumpkinJack@kot.com", password_hash:)

#Creating seed categories
negotiation = Category.create!(name: "Negotiation")
card = Category.create!(name: "Card game")
fantasy = Category.create!(name: "Fantasy")
mythology = Category.create!(name: "Mythology")
party = Category.create!(name: "Party Games")

#Creating Games
Game.create!(name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7)
Game.create!(name: "Oh My God! There's an Axe in My Head.", category: negotiation, min_players: 2, max_players: 6)
Game.create!(name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7)
Game.create!(name: "Zombie State: Diplomacy of the Dead", category: negotiation, min_players: 2, max_players: 5)
Game.create!(name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7)
Game.create!(name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7)
