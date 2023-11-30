require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    # Create 10 posts
    before do
      FactoryBot.create_list(:post, 10)
      get '/api/v1/posts'
    end

    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
