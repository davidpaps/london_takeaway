require 'Message'

describe Message do

  let(:client) { double :client }
  let(:message) { double :message }
  let(:subject) {described_class.new}

  it "sends text with order details" do
    twilio_message_body = { from: ENV["FROM"], to: ENV["TO"], body: message }
    allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
    expect(Twilio::REST::Client).to receive(:new).with(ENV['SID'], ENV['TOKEN']).and_return(client)
    subject.send(message)

  end
end