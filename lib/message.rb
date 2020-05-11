require 'twilio-ruby'
require 'dotenv'
Dotenv.load('.env')

class Message

  def initialize
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV['FROM']
    @to = ENV['TO']
  end

  def send(message)
    @client.messages.create(
    body: message,
    from: @from,  
    to: @to
    )
  end

end