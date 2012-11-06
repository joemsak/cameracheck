require 'spec_helper'

describe OptionsVenue do
  it "works" do
    option = Option.create!(:text => 'Flash OK')

    Venue.any_instance.stub(:address) { 'present' }

    venue  = Venue.create(:name => 'Hi',
                          :options_attributes =>
                            { '0' => {
                                :text => 'Point & Shoot OK'
                              },
                              '1' => {
                                :text => 'SLR OK'
                              }
                            },
                          :option_ids => [option.id])

    venue.should have(3).options
    Option.first.should have(1).venue
  end
end
