require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation test' do
    it 'ensures title is present' do
      article = Post.new(body: 'Test content')
      expect(article.valid?).to eq(false)
    end
    it 'ensures body is present' do
      article = Post.new(title: 'Test content')
      expect(article.valid?).to eq(false)
    end
    it 'ensures summary is present' do
      article = Post.new(summary: 'Test content')
      expect(article.valid?).to eq(false)
    end
  end
end
