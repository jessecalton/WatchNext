require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  describe 'visit home page' do
    it 'has the title of the page displayed' do
      visit '/'
      expect(page).to have_text("WatchNext")
    end

    it 'has links in the nav bar for Home, Login, Sign Up' do
      visit '/'
      expect(page).to have_link("Login")
      expect(page).to have_link("Home")
      expect(page).to have_link("Sign Up")
    end

    it 'allows user to sign in with demo account from the home page' do
      @demo = FactoryBot.create(:user, username: "demo", 
                                email: "demo@demo.com", 
                                password: "demo")
      visit '/'
      click_button "Demo"
      within("#demo-form") do
        fill_in "Email", :with => "demo@demo.com"
        fill_in "Password", :with => "demo"
        click_button "Login"
      end
      expect(page).to have_content("Hello movie lover, demo")
    end

    it 'displays the About section of the page' do
      visit '/'
      click_button "About"
      expect(page).to have_content("WatchNext will help you eliminate the time spent surfing Netflix and Hulu")
    end
  end
end
