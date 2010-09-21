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

protected

  def find_all_venues
    @venues = Venue.all
  end

  def find_page
    @page = Page.find_by_link_url("/venues")
  end

end
