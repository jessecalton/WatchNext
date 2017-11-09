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
      post "/users", :params => { :user => {:username => "tim", :email => "tim@tim.com", :password => "timtim", :password_confirmation => "timtim"} }
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end
end
