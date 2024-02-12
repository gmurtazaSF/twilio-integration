require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get :index
    end

    it 'assigns @notifications and @pagy' do
      notifications = Notification.all

      get :index

      expect(assigns(:notifications).first.recipient_phone).to eq(notifications.first.recipient_phone)
      expect(assigns(:pagy)).to be_present
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end
end
