class VenuesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with(@venues = Venue.includes(:options).all)
  end

  def show
    @venue = Venue.includes(:options).find(params[:id])
    build_option
    respond_with(@venue)
  end

  def new
    @venue = Venue.new
    build_option
    respond_with(@venue)
  end

  def edit
    @venue = Venue.find(params[:id])
    build_option
    respond_with(@venue)
  end

  def create
    @venue = Venue.new(params[:venue])
    @venue.save
    respond_with(@venue)
  end

  def update
    params[:venue][:option_ids] ||= []
    @venue = Venue.includes(:options).find(params[:id])
    @venue.update_attributes(params[:venue])
    respond_with(@venue)
  end

  private
  def build_option(venue = @venue)
    venue.options.build
  end
end
