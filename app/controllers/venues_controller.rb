class VenuesController < ApplicationController
  respond_to :js, :json, :html

  def index
    respond_with(@venues = Venue.includes(:options).all)
  end

  def show
    @venue = Venue.includes(:options).find(params[:id])
    build_option
    respond_with(@venue)
  end
  alias :edit :show

  def create
    respond_with(@venue = Venue.new(params[:venue]))
  end

  def update
    params[:venue][:option_ids] ||= []
    @venue = Venue.includes(:options).find(params[:id])
    @venue.update_attributes(params[:venue])
    respond_with(@venue)
  end

  private
  def new_venue
    @new_venue ||= Venue.new
    build_option(@new_venue)
    @new_venue
  end
  helper_method :new_venue

  def all_venues
    @all_venues ||= Venue.includes(:options).all
  end
  helper_method :all_venues

  def all_options
    @all_options ||= Option.includes(:venues).all
  end
  helper_method :all_options

  def build_option(venue = @venue)
    venue.options.build
  end
end
