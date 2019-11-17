# frozen_string_literal: true

class Dashboard::PresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_presentation, except: :index

  def index
    @presentations = current_user.presentations
  end

  def destroy
    @presentation.destroy
    flash[:success] = t('.success')

    redirect_to dashboard_presentations_path
  end

  private

  def set_presentation
    @presentation ||= current_user.presentations.find params[:id]
  end
end
