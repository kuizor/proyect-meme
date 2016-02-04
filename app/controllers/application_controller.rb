class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session#:exception
  #skip_before_action :require_login, only: [:create]

  before_action :authenticate
  
  private
  def authenticate
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by(token: token)
        
      end
  end
end
