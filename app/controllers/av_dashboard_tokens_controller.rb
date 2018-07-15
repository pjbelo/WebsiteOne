class AvDashboardTokensController < ApplicationController
  require 'jwt'
  require 'Date'

  def create
    expiration_timestamp = (DateTime.now + 1.day).strftime("%Q")
    payload = { authorized: 'true', exp: expiration_timestamp}
    @token = JWT.encode payload, Settings.av_dashboard_token_secret, 'HS256'
  end
end
