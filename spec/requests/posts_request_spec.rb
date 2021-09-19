require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe "Guest" do
    describe "GET /posts" do
      it "has a 302 status code" do
        get posts_path

        expect(response.status).to eq(302)
      end
    end
  end

  describe "User" do
    let!(:user) { FactoryBot.create(:user) }
    before { sign_in(user) }
    describe "GET /posts" do
      it "has a 200 status code" do
        get posts_path

        expect(response.status).to eq(200)
      end
    end
    describe "GET /posts/new" do
      it "has a 200 status code" do
        get new_post_path
        expect(response.status).to eq(200)
      end
    end
    describe "POST /posts" do
      it "has a 200 status code" do
        params = {post: {title: 'test', content: 'rspec'}}
        post posts_path params
        expect(response.status).to eq(302)
      end
    end
  end

end

