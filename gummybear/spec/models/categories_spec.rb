require 'rails_helper'

describe "::Categories" do
  let(:category) { Category.create!(name: "Jump") }

  it "should return the Category class for new user instances" do
    expect(category).to be_instance_of(Category)
  end

  it "should have a name" do
    expect(category.name).to eq("Jump")
  end
end
