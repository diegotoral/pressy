# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)

    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = current_user_session&.user
  end

  protected

  def handle_unverified_request
    current_user_session&.destroy
    redirect_to root_url
  end
end
