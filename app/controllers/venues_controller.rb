class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    build_option
  end
  alias :edit :show

  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      format.js
    end
  end

  def update
    @venue = Venue.find(params[:id])
    respond_to do |format|
      format.js do
        if @venue.update_attributes(params[:venue])
          render :update
        else
          render :failure
        end
      end
    end
  end

  private
  def new_venue
    @new_venue ||= Venue.new
    build_option(@new_venue)
    @new_venue
  end
  helper_method :new_venue

  def all_venues
    @all_venues ||= Venue.all
  end
  helper_method :all_venues

  def build_option(venue = @venue)
    venue.options.build
  end
end
