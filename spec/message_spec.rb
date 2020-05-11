require 'Message'

describe Message do

  let(:subject){described_class.new}
  let(:client) { double :client }
  let(:message) { "Thank you, your order has been placed and will arrive at #{(Time.now + (60 * 60)).strftime("%k:%M")}" }

  it "sends text with order details" do
    twilio_message_body = { body: message , from: ENV["FROM"], to: ENV["TO"],  }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['SID'], ENV['TOKEN']).and_return(client)
    subject.send
  end
 end