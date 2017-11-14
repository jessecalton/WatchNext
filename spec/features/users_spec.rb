require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
  end

  describe 'user adds a movie' do
    it 'updates to the page asynchronously' do
      login(@user)
      VCR.use_cassette('fargo', :record => :once) do
          fill_in 'search_title', with: "Fargo"
          within(:css, '#main') { click_button "Add Movie" }
      end
      expect(page).to have_content("Fargo")
    end
  end
end
