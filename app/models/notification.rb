# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :recipient_phone, :message, :trigger, presence: true
end
