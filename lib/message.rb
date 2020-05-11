# frozen_string_literal: true

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
    @message = "Thank you, your order has been placed and will arrive at #{delivery_time}"
  end

  def send
    @client.messages.create(
      body: @message,
      from: @from,
      to: @to
    )
  end

  def delivery_time
    (Time.now + (60 * 60)).strftime('%k:%M')
  end
end
