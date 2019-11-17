# frozen_string_literal: true

class UserSessionsController < LandingController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new user_session_params

    if @user_session.save
      flash[:success] = t('.success')

      redirect_to dashboard_root_url
    else
      flash[:error] = t('.error')

      render :new
    end
  end

  def destroy
    current_user_session.destroy

    redirect_to root_url
  end

  private

  def user_session_params
    params
      .require(:user_session)
      .permit(:email, :password, :password_confirmation)
      .to_h
  end
end
