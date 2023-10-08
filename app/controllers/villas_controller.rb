class VillasController < ApplicationController
  before_action :set_villa, only: [:show]
  before_action :parse_dates

  def index
    sort_by = params[:sort_by]
    villas_details = VillaService.get_villas(@start_date, @end_date, sort_by)

    render json: villas_details
  end

  def show
    villa_info = VillaService.get_villa_info(@villa, @start_date, @end_date)

    render json: villa_info
  end

  private

  def set_villa
    @villa = Villa.find(params[:id])
  end

  def parse_dates
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
  end
end