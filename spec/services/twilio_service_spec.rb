require 'rails_helper'

RSpec.describe TwilioService, type: :service do
  let(:recipient_phone) { '1234567890' }
  let(:body) { 'Test SMS Body' }
  let(:trigger) { 'test_trigger' }

  describe '#send_sms' do
    it 'sends an SMS using Twilio client' do
      # Stub Twilio client and its messages create method
      twilio_client_double = instance_double(Twilio::REST::Client)
      allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client_double)

      messages_double = instance_double(Twilio::REST::Api::V2010::AccountContext::MessageInstance)
      allow(twilio_client_double).to receive_message_chain(:messages, :create).and_return(messages_double)

      # Expect Twilio client to receive the create method with the correct arguments
      expect(twilio_client_double.messages).to receive(:create).with(
        from: ENV.fetch('TWILIO_PHONE_NUMBER'),
        to: recipient_phone,
        body: body
      )

      # Mock the sid method on the returned Message object
      allow(messages_double).to receive(:sid).and_return('mocked_sid')

      # Expect Rails logger to receive the info method
      expect(Rails.logger).to receive(:info).with(/SMS sent to #{recipient_phone}/)

      # Initialize TwilioService and call send_sms
      TwilioService.new(recipient_phone, body, trigger).send_sms
    end
  end
end
