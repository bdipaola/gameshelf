# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Requiring faker
require 'faker'

#Destroying all records
User.destroy_all
Game.destroy_all
Category.destroy_all
Friending.destroy_all
UserGame.destroy_all

#Creating seed users
nic = User.create!(name: "Nic", username: "Nic", email: "nic@nic.com", password_hash: BCrypt::Password.create("12345"))
christine = User.create!(name: "Christine", username: "Christine", email: "christine@christine.com", password_hash: BCrypt::Password.create("12345"))
john = User.create!(name: "John", username: "John", email: "john@john.com", password_hash: BCrypt::Password.create("12345"))
ben = User.create!(name: "Ben", username: "Ben", email: "ben@ben.com", password_hash: BCrypt::Password.create("12345"), friends: [nic, christine, john])
User.create!(name: "Brockenbar", username: "Brockenbar", email: "Brockenbar@kot.com", password_hash: BCrypt::Password.create("12345"))
User.create!(name: "Space Penguin", username: "SpacePenguin", email: "SpacePenguin@kot.com", password_hash: BCrypt::Password.create("12345"))
User.create!(name: "Boogey Woogey", username: "BoogeyWoogey", email: "BoogeyWoogey@kot.com", password_hash: BCrypt::Password.create("12345"))
User.create!(name: "Pumpkin Jack", username: "Pumpkin Jack", email: "PumpkinJack@kot.com", password_hash: BCrypt::Password.create("12345"))

#Creating seed categories
negotiation = Category.create!(name: "Negotiation")
dice = Category.create!(name: "Dice")
travel = Category.create!(name: "Travel")
civilization = Category.create!(name: "Civilization")

#Creating Games
Game.create!(users: [ben, john], name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7, description: "In the game, players represent one of the seven 'Great Powers of Europe' (Great Britain, France, Austria-Hungry, Germany, Italy, Russia or Turkey) in the years prior to World War I. Play begins in the Spring of 1901, and players make both Spring and Autumn moves each year. There are only two kinds of military units: armies and fleets. On any given turn, each of your military units has limited options: they can move into an adjoining territory, support an allied unit in an attack on an adjoining territory, support an allied unit in defending an adjoining territory, or hold their position. Players instruct each of their units by writing a set of \"orders.\" The outcome of each turn is determined by the rules of the game. There are no dice rolls or other elements of chance. With its incredibly simplistic movement mechanics fused to a significant negotiation element, this system is highly respected by many a gamer.")
Game.create!(users: [ben, john], name: "Oh My God! There's an Axe in My Head.", category: negotiation, min_players: 2, max_players: 6, description: "Geneva, 1920: The League of Nations convenes for the first time. Proud to be the host for this august world body, Switzerland invites its champion axe-juggling troupe, \"Les Bella Lieben Jolie De Von Giorno\", to entertain the assembled delegates. Unfortunately, halfway through the demonstration, the Troupe goes insane and begins hurling axes into the audience, splitting head after head. The Secretary General calls for calm, but before he can order a recess, his cranium is split as well. In Oh My God! There's An Axe In My Head. The Game of International Diplomacy, the remaining Great Powers use the confusion to pass the gavel between themselves, conduct international business amidst the chaos, and generally try to shift the balance of world power while escaping a bunch of armed psychopaths.")
Game.create!(users: [nic, john], name: "Ticket to Ride", category: travel, min_players: 2, max_players: 5, description: "With elegantly simple gameplay, Ticket to Ride can be learned in under 15 minutes, while providing players with intense strategic and tactical decisions every turn. Players collect cards of various types of train cars they then use to claim railway routes in North America. The longer the routes, the more points they earn. Additional points come to those who fulfill Destination Tickets – goal cards that connect distant cities; and to the player who builds the longest continuous route. 'The rules are simple enough to write on a train ticket – each turn you either draw more cards, claim a route, or get additional Destination Tickets,\" says Ticket to Ride author, Alan R. Moon. \"The tension comes from being forced to balance greed – adding more cards to your hand, and fear – losing a critical route to a competitor. Ticket to Ride continues in the tradition of Days of Wonder's big format board games featuring high-quality illustrations and components including: an oversize board map of North America, 225 custom-molded train cars, 144 illustrated cards, and wooden scoring markers. Since its introduction and numerous subsequent awards, Ticket to Ride has become the BoardGameGeek epitome of a \"gateway game\" -- simple enough to be taught in a few minutes, and with enough action and tension to keep new players involved and in the game for the duration.")
Game.create!(users: [nic, john], name: "Zombie State: Diplomacy of the Dead", category: negotiation, min_players: 2, max_players: 5, description: "The world is too late. The virus known as MV1 has gone global. You, the leader of your people, have moved quickly to consolidate your local governments in hopes that you are not too late to carve some chance of hope out of what appears to be none. Rushing to develop effective technologies and retrain your military against this new threat proves difficult but is your only chance at salvation. Resources will prove important and become continually scarce as MV1 continues to sweep through your territory. Do you have what it takes to keep your people alive? Or, better yet, can you eliminate the threat of the walking dead from your territory completely? Many technologies lay at your disposal if you test them successfully, but the true strength of these technologies lie in the versatile combinations that you choose to use. Will you rely on military strength, physics and science, or research medicine to find a cure? Perhaps your survival lies in utilizing combinations of these technologies. Either way your fallen countrymen have only one form of diplomacy and that is that they are at peace only when they are feeding. Feeding on you and your people and spreading the deadly MV1 viral infection. Welcome to The Zombie State: Diplomacy of the Dead.")
Game.create!(users: [christine, john], name: "Settlers of Catan", category: civilization, min_players: 3, max_players: 4, description: "Begin a quest to settle the island of Catan! Guide your brave settlers to victory by using clever trading and shrewd development. Use resources – grain, wool, ore, lumber, and brick – to build roads, settlements, cities and key cultural milestones. Get resources by rolling the dice or by trading with other players. But beware! You never know when someone will block your way or if the robber will strike and steal your hard-earned goods! Are you the best trader, builder, or settler? Will you master Catan?")
Game.create!(users: [christine, john], name: "King of Tokyo", category: dice, min_players: 2, max_players: 6, description: "In King of Tokyo, you play mutant monsters, gigantic robots, and strange aliens – all of whom are destroying Tokyo and whacking each other in order to become the one and only King of Tokyo. At the start of each turn, you roll six dice. The dice show the following six symbols: 1, 2, or 3 Victory Points, Energy, Heal, and Attack. Over three successive throws, choose whether to keep or discard each die in order to win victory points, gain energy, restore health, or attack other players into understanding that Tokyo is YOUR territory. The fiercest player will occupy Tokyo, and earn extra victory points, but that player can't heal and must face all the other monsters alone! Top this off with special cards purchased with energy that have a permanent or temporary effect, such as the growing of a second head which grants you an additional die, body armor, nova death ray, and more.... and it's one of the most explosive games of the year! In order to win the game, one must either destroy Tokyo by accumulating 20 victory points, or be the only surviving monster once the fighting has ended.")

#Creating comments
user_ids = User.all.map { |user| user.id }
Game.all.each do |game|
  (rand(3)+1).times do
    game.comments.create(user_id: user_ids.sample, content: Faker::Lorem.sentence(4))
  end
end

