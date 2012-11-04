class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.new(:name => name)

    respond_to do |format|
      format.js
      format.html {
        if @venue.save
          redirect_to venues_url
        else
          render :new
        end
      }
    end
  end

  private
  def name
    raise MustPassVenueParams unless params[:venue]
    params[:venue][:name]
  end
end

class MustPassVenueParams < Exception
end
