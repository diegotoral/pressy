# frozen_string_literal: true

class Dashboard::PresentationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @presentations = current_user.presentations
  end
end
