require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:recipient_phone) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:trigger) }
  end
end
