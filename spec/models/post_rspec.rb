require 'rails_helper'

RSpec.describe Post, type: :model do
	it "is valid with user and text" do
  	expect(build(:post)).to be_valid
  end
  
  it "is invalid without content" do
  	post = build(:post, content: nil)
  	post.valid?
  	expect(post.errors[:content]).to include("não pode ficar em branco")
  end
  
end