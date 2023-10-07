class VillasController < ApplicationController
  before_action :set_villa, only: [:show]

  def index
    start_date = params[:start_date]
    end_date = params[:end_date]
    sort_by = params[:sort_by] || 'availability'  # default sort by availability

    @villas = VillaService.get_villas(start_date, end_date, sort_by)

    render json: @villas
  end

  # GET /villas/:id
  def show
    # Add logic here to calculate total rate and check availability for the entered dates
  end

  private

  def set_villa
    @villa = Villa.find(params[:id])
  end
end