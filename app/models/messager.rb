class Messager

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']


    @client = Twilio::REST::Client.new @account_sid, @auth_token

  end


  def send_message(phone_number)
    if phone_number.length != 12
      return false
    end
      text_message = @client.api.account.messages.create(
        from: @twilio_number,
        to: phone_number,
        body: "test"
        )

      puts text_message.to
  end


end