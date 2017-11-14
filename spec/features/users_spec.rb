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
  describe 'user adds a movie using advanced search' do
    it 'updates to the page asynchronously' do
      login(@user)
      find('p', :text => 'Advanced Search').click
      
      VCR.use_cassette('jedi', :record => :once) do
          fill_in 'adv_search_title', with: "star wars"
          fill_in 'adv_search_year', with: "1983"

          within(:css, 'form.search-form.advanced') { click_button "Add Movie" }
      end
      expect(page).to have_content("Return of the Jedi")
      
    end
  end

  xdescribe 'movie filter function' do
    xit 'allows a user to select movies based on Rotten Tomatoes score' do
      login(@user)
      # fill_in "runtime", with: "120"

      within(:css, 'form#filter.search-form') { click_button "Search" }
      wait_until { find(".movie-criteria", visible: true) }


      expect(page).to have_content("Your search returned no movies")

      # save_and_open_page
    end
  end
end
