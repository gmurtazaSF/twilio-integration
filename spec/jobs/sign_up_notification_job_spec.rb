require 'rails_helper'

RSpec.describe SignUpNotificationJob, type: :job do
  describe '#perform' do
    let(:recipient_phone) { '+1234567890' }

    it 'enqueues a job to send SMS using TwilioService' do
      allow(TwilioService).to receive(:new).and_return(double('TwilioService', send_sms: true))

      expect do
        SignUpNotificationJob.perform_later(recipient_phone)
      end.to have_enqueued_job(SignUpNotificationJob)
    end

    it 'calls send_sms method on TwilioService' do
      twilio_service_instance = instance_double('TwilioService', send_sms: true)
      allow(TwilioService).to receive(:new).and_return(twilio_service_instance)

      expect(twilio_service_instance).to receive(:send_sms)

      SignUpNotificationJob.perform_now(recipient_phone)
    end
  end
end
