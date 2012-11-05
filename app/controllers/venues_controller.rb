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
    params[:venue][:option_ids] ||= []
    @venue = Venue.includes(:options).find(params[:id])
    respond_to do |format|
      format.js do
        if @venue.update_attributes(params[:venue])
          render :update
        else
          render :nothing => true, :status => 403
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
