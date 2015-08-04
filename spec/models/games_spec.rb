require 'rails_helper'

describe "::Games" do
  let(:sports_category) { Category.create!(name: "sports") }
  let(:game) { Game.create!(name: "7up", category: sports_category, min_players: 2, max_players: 7, description: "In the game, players represent one of the seven 'Great Powers of Europe' (Great Britain, France, Austria-Hungry, Germany, Italy, Russia or Turkey) in the years prior to World War I. Play begins in the Spring of 1901, and players make both Spring and Autumn moves each year. There are only two kinds of military units: armies and fleets. On any given turn, each of your military units has limited options: they can move into an adjoining territory, support an allied unit in an attack on an adjoining territory, support an allied unit in defending an adjoining territory, or hold their position. Players instruct each of their units by writing a set of \"orders.\" The outcome of each turn is determined by the rules of the game. There are no dice rolls or other elements of chance. With its incredibly simplistic movement mechanics fused to a significant negotiation element, this system is highly respected by many a gamer.") }

  it "should have a class of Game" do
    expect(game).to be_instance_of(Game)
  end

  it "should belong to a category" do
    expect(game.category.name).to eq("sports")
  end

  it "should have a description" do
    expect(game.description).to be_truthy
  end
end
