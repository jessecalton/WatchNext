require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionHelper. For example:
#
# describe SessionHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
  end

  describe '#log_in' do
    it 'logs in a user' do
      helper.log_in(@user)
      expect(session[:user_id]).to be(@user.id)
    end
  end

  describe '#current_user' do
    it 'creates a @current_user variable if one does not already exist' do
      helper.log_in(@user)
      expect(helper.current_user.id).to be(@user.id)
    end
    it 'fails if no user is currently logged in' do
      expect(helper.current_user.nil?).to be true
    end
  end

  describe '#logged_in?' do
    it 'returns true if user is logged in' do
      helper.log_in(@user)
      expect(helper.logged_in?).to be true
    end
    it 'returns false if user is not logged in' do
      expect(helper.logged_in?).to be false
    end
  end

  describe '#log_out' do
    it 'deletes the current session' do
      helper.log_in(@user)
      helper.log_out
      expect(session[:user_id]).to be nil
    end
  end
end
