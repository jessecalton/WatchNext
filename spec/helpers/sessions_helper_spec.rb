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
end
