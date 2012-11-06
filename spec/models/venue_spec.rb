require 'vcr_helper'
require 'spec_helper'

describe Venue do

  it "requires a name" do
    venue = Venue.new(:name => nil)
    venue.valid?
    venue.errors[:name].should include("can't be blank")
  end

  it "looks up the address" do
    VCR.use_cassette('look up venue address') do
      venue = Venue.create!(:name => 'Majestic Theatre')
      venue.address.should == '245 W 44th St New York, NY 10036'
    end
  end
end
