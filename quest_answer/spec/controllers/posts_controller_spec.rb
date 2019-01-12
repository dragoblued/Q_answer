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
  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end
  describe "GET #edit" do
    it "returns a success response" do
  		post = Post.create(title: "Test title", summary: "Test content", body: "Test content")
      get :edit, params: {id: post.to_param}
      expect(response).to be_successful
    end
  end
  describe "POST #create" do
     it "creates a new Post" do
      expect {
  			post = Post.create(title: "Test title", summary: "Test content", body: "Test content")
      }.to change(Post, :count).by(1)
    end
  end
end
