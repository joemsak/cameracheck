class OptionsVenue < ActiveRecord::Base
  belongs_to :option
  belongs_to :venue
end
