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
  end
end
