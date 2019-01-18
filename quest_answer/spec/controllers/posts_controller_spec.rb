require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
  describe "GEt #show" do
  	let(:post) {Post.create(title: "Test title", summary: "Test summary", body: "Test body")}
	  it "returns a success response" do
	  	get :show, params: {id: post}
	  	expect(response).to be_successful
  	end
  end
  describe "POST #create valid" do
     it "creates a new Post" do
      expect {
  			post = Post.create(title: "Test title", summary: "Test summary", body: "Test body")
      }.to change(Post, :count).by(1)
    end
  end
  describe "POST #create invalid" do
     it "creates a new Post (title, body)" do
      expect {
        post = Post.create(title: "Test title", body: "Test body")
      }.to change(Post, :count).by(0)
    end
     it "creates a new Post (body, summary)" do
      expect {
        post = Post.create(body: "Test body", summary: "Test summary")
      }.to change(Post, :count).by(0)
    end
     it "creates a new Post (title, summary)" do
      expect {
        post = Post.create(title: "Test title", summary: "Test summary")
      }.to change(Post, :count).by(0)
    end
      it "creates a new Post (body)" do
      expect {
        post = Post.create(body: "Test body")
      }.to change(Post, :count).by(0)
    end
      it "creates a new Post (title)" do
      expect {
        post = Post.create(title: "Test title")
      }.to change(Post, :count).by(0)
    end
      it "creates a new Post (summary)" do
      expect {
        post = Post.create(summary: "Test summary")
      }.to change(Post, :count).by(0)
    end

  end
  describe "POST #delete" do
    it "delete a new Post" do
  	  post = Post.create(title: "Test title", summary: "Test summary", body: "Test body")
      post.destroy
      expect(Post.count).to eq(0)
    end
  end
end
