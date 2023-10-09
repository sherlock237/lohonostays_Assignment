class VillasController < ApplicationController
  before_action :set_villa, only: [:show]
  before_action :parse_dates

  def index
    sort_by = params[:sort_by]
    begin
      villas_details = VillaService.get_villas(@start_date, @end_date, sort_by)
      render json: villas_details
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def show
    begin
      villa_info = VillaService.get_villa_info(@villa, @start_date, @end_date)
      render json: villa_info
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def set_villa
    begin
      @villa = Villa.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: 'Villa not found' }, status: :not_found
    end
  end

  def parse_dates
    begin
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
    rescue ArgumentError => e
      render json: { error: 'Invalid date format' }, status: :bad_request
    end
  end
end
