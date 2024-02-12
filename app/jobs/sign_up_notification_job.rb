# frozen_string_literal: true

class SignUpNotificationJob < ApplicationJob
  def perform(recipient_phone)
    TwilioService.new(recipient_phone, I18n.t('sign_up.message'), I18n.t('sign_up.trigger')).send_sms
  end
end
