require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with first name, last name, email and password" do
  	expect(build(:user)).to be_valid
  end

  it "is valid without password confirmation" do
    user = build(:user, password_confirmation: nil)
    expect(user).to be_valid
  end

  it "is invalid without first name" do
  	user = build(:user, first_name: nil)
  	user.valid?
  	expect(user.errors[:first_name]).to include("não pode ficar em branco")
  end

  it "is invalid without last name" do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("não pode ficar em branco")
  end

  it "is invalid without email" do
  	user = build(:user, email: nil)
  	user.valid?
  	expect(user.errors[:email]).to include("não pode ficar em branco")
  end

  it "is invalid without password" do
  	user = build(:user, password: nil)
  	user.valid?
  	expect(user.errors[:password]).to include("não pode ficar em branco")
  end

  it "is invalid first name with more than 100 characters" do
  	user = build(:user, first_name: Faker::Lorem.characters(110))
  	user.valid? 
  	expect(user.errors[:first_name]).to include("é muito longo (máximo: 100 caracteres)")
  end

  it "is invalid last name with more than 100 characters" do
    user = build(:user, last_name: Faker::Lorem.characters(110))
    user.valid? 
    expect(user.errors[:last_name]).to include("é muito longo (máximo: 100 caracteres)")
  end

end