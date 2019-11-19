# frozen_string_literal: true

class Dashboard::PreviewsController < ApplicationController
  before_action :authenticate_user!

  def show
    @presentation = current_user.presentations.find params[:id]
  end
end
