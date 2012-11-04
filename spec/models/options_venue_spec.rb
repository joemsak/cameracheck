require 'spec_helper'

describe OptionsVenue do
  it "works" do
    option = Option.create!(:text => 'Flash OK')

    venue  = Venue.new(:name => 'Hi',
                       :options_attributes =>
                         { '0' => {
                             :text => 'Point & Shoot OK'
                           },
                           '1' => {
                             :text => 'SLR OK'
                           }
                         },
                       :option_ids => [option.id])

    venue.address = 'prevent filter'
    venue.save

    venue.should have(3).option
    Option.first.should have(1).venue
  end
end
