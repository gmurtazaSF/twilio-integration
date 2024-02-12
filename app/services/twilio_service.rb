# frozen_string_literal: true

class TwilioService
  attr_accessor :recipient_phone, :body, :trigger

  def initialize(recipient_phone, body, trigger)
    @recipient_phone = recipient_phone
    @body = body
    @trigger = trigger
  end

  def send_sms
    message = client.messages.create(
      from: ENV.fetch('TWILIO_PHONE_NUMBER'),
      to: recipient_phone,
      body: body
    )

    Rails.logger.info("SMS sent to #{recipient_phone} with SID #{message.sid} for #{trigger} trigger")
  end

  private

  def client
    Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
  end
end
