# frozen_string_literal: true

class Dashboard::PresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_presentation, except: %i[index new create]

  def index
    @presentations = paginate(current_user.presentations.order(created_at: :desc))
  end

  def new
    @presentation = current_user.new_presentation
  end

  def create
    @presentation = current_user.new_presentation presentation_params

    if @presentation.save
      flash[:success] = t('.success')
      ExtractPresentationPagesJob.perform_later @presentation

      redirect_to dashboard_presentations_path
    else
      flash[:error] = t('.error')

      redirect_to action: :new
    end
  end

  def edit
    @slides = @presentation.slides
      .map(&:background_image)
      .map { |image| url_for image.variant(resize_to_fit: [480, 320]) }
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

  def presentation_params
    params
      .require(:presentation)
      .permit(:name, :description, :source_file)
  end
end
