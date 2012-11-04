class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end
  alias :edit :show

  def create
    @venue = Venue.new(:name => name)

    respond_to do |format|
      format.js
    end
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.name    = name
    @venue.address = address
    respond_to do |format|
      format.js
    end
  end

  private
  def name
    check_for_venue_params
    params[:venue][:name]
  end

  def address
    check_for_venue_params
    params[:venue][:address]
  end

  def check_for_venue_params
    raise MustPassVenueParams unless params[:venue]
  end

  def new_venue
    @new_venue ||= Venue.new
  end
  helper_method :new_venue

  def all_venues
    @all_venues ||= Venue.all
  end
  helper_method :all_venues
end

class MustPassVenueParams < Exception
end
