require 'rails_helper'

RSpec.describe "Applications", type: :request do
    describe "GET index" do
      it "has a 200 status code" do
        get '/'
        expect(response.status).to eq(200)
      end
    end
end
