require 'refinery'

module Refinery
  module Venues
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "venues"
          plugin.activity = {:class => Venue,
          :title => 'name'
        }
        end
      end
    end
  end
end
