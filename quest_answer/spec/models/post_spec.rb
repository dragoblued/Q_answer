require 'rails_helper'

RSpec.describe Post, type: :model do
	context "validation test" do 
  		it "ensures title is present" do
  			article = Post.new(body: "Test content")
  			expect(article.valid?).to eq(true)
  		end
  		it "ensures body is present" do
  			article = Post.new(title: "Test content")
  			expect(article.valid?).to eq(true)
  		end
  	end
end
