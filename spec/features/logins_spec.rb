require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
  end

  describe "GET /login" do
    it "logs in a registered user" do
      visit "/login"
      fill_in "Email", with: "tom@tomtom.com"
      fill_in "Password", with: "tomtom"

      click_button "Login"

      

      expect(page).to have_content("Hello")
    end
  end
end
