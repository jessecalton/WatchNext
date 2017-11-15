require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
  end

  describe "GET /login" do
    it "logs in and logs out a registered user" do
      visit "/login"
      fill_in "Email", with: "tom@tomtom.com"
      fill_in "Password", with: "tomtom"

      click_button "Login"

      

      expect(page).to have_content("Hello movie lover, #{@user.username}")

      click_link "Logout"

      expect(current_path).to eq '/'
      expect(page).to have_content "Login"
    end
  end
end
