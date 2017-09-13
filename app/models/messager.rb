class Messager
  include MoviesHelper
  include SessionsHelper


  def test_method
    p "this works"
  end

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']


    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def send_message(phone_number)
    text_message = @client.api.account.messages.create(
      from: @twilio_number,
      to: phone_number,
      body: "test post"
      
      )

    puts text_message.to
  end
end