require 'rails_helper'

describe GamesController do
  describe "games#index" do
    it "should get index" do
      get 'index'
      expect(response).to be_success
    end

    context "when called as a root route" do
      it "loads all games" do
        ben = User.create!(name: "Ben", username: "Ben", email: "ben@ben.com", password_hash: BCrypt::Password.create("12345"))
        negotiation = Category.create!(name: "Negotiation")
        game_1 = Game.create!(users: [ben], name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7, description: "In the game")
        game_2 = Game.create!(users: [ben], name: "Oh My God! There's an Axe in My Head.", category: negotiation, min_players: 2, max_players: 6, description: "Geneva,")

        get :index, {}

        expect(assigns(:games)).to include(game_1)
        expect(assigns(:games)).to include(game_2)
      end
    end

    context "when nested under a user" do
      it "loads only the games for a user" do
        ben = User.create!(name: "Ben", username: "Ben", email: "ben@ben.com", password_hash: BCrypt::Password.create("12345"))
        nic = User.create!(name: "Nic", username: "Nic", email: "nic@nic.com", password_hash: BCrypt::Password.create("12345"))
        negotiation = Category.create!(name: "Negotiation")
        game_1 = Game.create!(users: [ben], name: "Diplomacy", category: negotiation, min_players: 7, max_players: 7, description: "In the game")
        game_2 = Game.create!(users: [nic], name: "Oh My God! There's an Axe in My Head.", category: negotiation, min_players: 2, max_players: 6, description: "Geneva,")

        get :index, {user_id: ben.id}

        expect(assigns(:games)).to include(game_1)
        expect(assigns(:games)).not_to include(game_2)
      end
    end
    
  end
end