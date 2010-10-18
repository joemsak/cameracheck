class VenuesController < ApplicationController

  before_filter :find_all_venues
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @venue in the line below:
    present(@page)
  end

  def show
    @venue = Venue.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @venue in the line below:
    present(@page)
  end
  
  def new
    @venue = Venue.new
  end
  
  def edit
    @venue = Venue.find(params[:id])
  end
  
  def create
    @venue = Venue.new(params[:venue])
    if @venue.save
      redirect_to @venue, :notice => '<div class="success">Thanks for submitting a new venue. <strong>You rock.</strong></div>'
    else
      render :new
    end
  end
  
  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(params[:venue])
      redirect_to @venue, :notice => '<div class="success">Thanks for fixing the venue information. <strong>You rock.</strong></div>'
    else
      render :edit
    end
  end

protected

  def find_all_venues
    @venues = Venue.all
  end

  def find_page
    @page = Page.find_by_link_url("/venues")
  end

end
