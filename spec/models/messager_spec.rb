require 'rails_helper'

RSpec.describe Messager, type: :model do
  before(:context) do
    @user = FactoryBot.create(:user_with_movies)
    @message = Messager.new(ENV["TEST_ACCOUNT_SID"], ENV["TEST_AUTH_TOKEN"], "+15005550006")


    @movie_string = " "
    @user.movies.each do |movie|
      @movie_string << "\n" + movie.title
    end
    @movie_string
      
  end

  describe '#send_message' do
    it 'sends an SMS message of a user\'s watch list to their smart phone' do
      expect(@message.send_message("+15005550006", @movie_string, @user.username)).to be true
    end
    it 'does not send an SMS message if the phone number is invalid' do
      expect(@message.send_message("+15005550001", @movie_string, @user.username)).to be false
    end
  end
end
