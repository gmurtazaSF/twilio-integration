# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true, uniqueness: true, length: { minimum: 11 }
  before_validation :clean_phone_number
  after_commit :enqueue_notification, on: :create

  private

  def enqueue_notification
    Notification.create(recipient_phone: phone_number, message: I18n.t('sign_up.message'), trigger: I18n.t('sign_up.trigger'))

    SignUpNotificationJob.perform_later(phone_number)
  end

  def clean_phone_number
    return if phone_number.nil?

    # Remove non-digit characters from the phone number
    self.phone_number = phone_number.gsub(/[^a-zA-Z0-9]/, '')

    unless phone_number.match?(/\A[0-9]+\z/)
      errors.add(:phone_number, 'can only contain numeric characters')
    end

    self.phone_number = '+' + phone_number
  end
end
