require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'validations' do
      it 'validates that phone_number contains only numeric characters' do
        user = build(:user, phone_number: 'abc123')
        user.valid?
        expect(user.errors[:phone_number]).to include('can only contain numeric characters')
      end

      it 'validates the minimum length of phone_number' do
        user = build(:user, phone_number: '123')
        user.valid?
        expect(user.errors[:phone_number]).to include('is too short (minimum is 11 characters)')
      end
    end

    it 'validates that phone_number contains only numeric characters' do
      user = build(:user, phone_number: 'abc123')
      user.valid?
      expect(user.errors[:phone_number]).to include('can only contain numeric characters')
    end
  end

  describe 'callbacks' do
    describe 'before_validation' do
      it 'cleans the phone_number' do
        user = build(:user, phone_number: '+1 (123) 456-7890')
        user.valid?
        expect(user.phone_number).to eq('+11234567890')
      end
    end

    describe 'after_commit' do
      it 'enqueues SignUpNotificationJob' do
        user = create(:user)
        expect(SignUpNotificationJob).to have_been_enqueued.with(user.phone_number)
      end

      it 'creates a notification with the correct attributes' do
        user = create(:user)
        notification = Notification.last
        expect(notification.recipient_phone).to eq(user.phone_number)
        expect(notification.message).to eq(I18n.t('sign_up.message'))
        expect(notification.trigger).to eq(I18n.t('sign_up.trigger'))
      end
    end
  end
end
