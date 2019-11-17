# frozen_string_literal: true

class UsersController < LandingController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t('.success')

      redirect_to dashboard_root_path
    else
      flash[:error] = t('.error')

      render :new
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:email, :password, :password_confirmation)
  end
end
