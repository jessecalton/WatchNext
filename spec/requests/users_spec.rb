require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "has a 200 status code" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
  describe "CREATE user" do
    it "creates a User and redirects to the User\'s page" do
      get "/users/new"
      expect(response).to render_template(:new)
      
    end
  end
end
