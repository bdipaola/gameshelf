require "rails_helper"

describe "LoginHelper" do

  let(:user) { User.create(name: "name", username: "username", email: "a@b.c", password_hash: BCrypt::Password.create("password"))}

  describe "#current_user" do
    it "returns nil if no user is logged in" do
      expect(helper.current_user).to eq nil
    end

    it "returns the current_user if a user is logged in" do
      session[:user_id] = user.id
      expect(helper.current_user).to eq user
    end
  end

  describe "#find_user" do
    it "returns nil if no matching username in the database" do
      expect(helper.find_user("pi39ck`~")).to eq nil
    end

    it "returns the appropriate user if in the database" do
      user
      expect(helper.find_user("username")).to eq user
    end
  end

  describe "#login" do
    it "logs the current user in" do
      helper.login(user)
      expect(session[:user_id]).to eq user.id
    end
  end

  describe "#logout" do
    it "logs the current user out" do
      session[:user_id] = 27
      helper.logout
      expect(session[:user_id]).to eq nil
    end
  end

end