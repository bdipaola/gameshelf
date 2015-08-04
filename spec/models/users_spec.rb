require 'rails_helper'

describe "::Users" do
  let(:user) { User.create(name: "Yoggie", username: "picnicHunter", email: "yoggie@park.com")}

  it "should return the User class for new user instances" do
    expect(user).to be_instance_of(User)
  end

  it "should have a name" do
    expect(user.name).to eq("Yoggie")
  end

  it "should have a username" do
    expect(user.username).to eq("picnicHunter")
  end

  it "should have an email" do
    expect(user.email).to eq("yoggie@park.com")
  end

end
