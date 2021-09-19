require 'rails_helper'

RSpec.describe "Applications", type: :request do

  describe "Guest" do
    describe "GET /" do
      it "has a 200 status code" do
        get root_path
        expect(response.status).to eq(200)
      end
      it "has a links for unsigned user" do
        get root_path
        expect(response.body).to include(root_path)
        expect(response.body).to include(login_path)
      end
    end
  end

  describe "User" do
    let!(:user) { FactoryBot.create(:user) }
    before { sign_in(user) }
    describe "GET /" do
      it "has a 200 status code" do
        get root_path
        expect(response.status).to eq(200)
      end
      it "has a links for signed user" do
        get root_path
        expect(response.body).to include(root_path)
        expect(response.body).to include(new_post_path)
        expect(response.body).to include(posts_path)
        expect(response.body).to include(destroy_user_session_path)
      end
    end
  end

end
