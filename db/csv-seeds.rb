require 'pp'
require 'csv'

Category.destroy_all
Game.destroy_all
User.destroy_all

mike = User.create!(name: "mike", username: "mike", email: "mike@mike.com", password_hash: BCrypt::Password.create("12345"))
tim = User.create!(name: "tim", username: "tim", email: "tim@tim.com", password_hash: BCrypt::Password.create("12345"))

# parse csv
game_specs = []
CSV.table('db/mikes-games.csv').each { |game_data| game_specs << game_data.to_h }

# create new categories
new_categories = []
game_specs.each { |game_spec| new_categories << game_spec[:category] }
new_categories.uniq!
new_categories.each { |category_name| Category.create!(name: category_name)}

game_specs.each do |game_spec|
	game_spec[:users] = [mike]
	game_spec[:category] = Category.find_by(name: game_spec[:category])
	Game.create!(game_spec)
end
