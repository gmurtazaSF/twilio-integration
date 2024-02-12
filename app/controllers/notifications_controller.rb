# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @pagy, @notifications = pagy(Notification.all)
  end
end
