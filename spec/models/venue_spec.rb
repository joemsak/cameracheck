require 'vcr_helper'
require 'spec_helper'

describe Venue do

  it "requires a name" do
    VCR.use_cassette('check validity???') do
      venue = Venue.new(:name => nil)
      venue.valid?
      venue.errors[:name].should include("can't be blank")
    end
  end

  it "looks up the address" do
    VCR.use_cassette('look up venue address') do
      venue = Venue.create!(:name => 'Majestic Theatre')
      venue.address.should == '278 Broadway, New York, NY 10007, USA'
    end
  end
end
