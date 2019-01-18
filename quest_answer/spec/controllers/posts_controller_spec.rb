require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
  describe "GEt #show" do
  	let(:post) {Post.create(title: "Test title", summary: "Test content", body: "Test content")}
	  it "returns a success response" do
	  	get :show, params: {id: post}
	  	expect(response).to be_successful
  	end
  end
  describe "POST #create valid" do
     it "creates a new Post" do
      expect {
  			post = Post.create(title: "Test title", summary: "Test content", body: "Test content")
      }.to change(Post, :count).by(1)
    end
  end
  describe "POST #create invalid" do
     it "creates a new Post (title, body)" do
      expect {
        post = Post.create(title: "Test title", body: "Test content")
      }.to change(Post, :count).by(0)
    end
  end
  describe "POST #delete" do
    it "delete a new Post" do
  	  post = Post.create(title: "Test title", summary: "Test content", body: "Test content")
      post.destroy
      expect(Post.count).to eq(0)
    end
  end
end
