class Messager
  attr_reader :error
  attr_reader :client

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']


    @client = Twilio::REST::Client.new @account_sid, @auth_token

  end


  def send_message(phone_number, movies, username)
    begin
      text_message = @client.api.account.messages.create(
        from: @twilio_number,
        to: phone_number,
        body: "Hello movie lover, #{username}!\nHere is your current watch list:\n#{movies}"
        )

      return true
    rescue Twilio::REST::RestError => error
      @error = error
      return false
    end



  end


end