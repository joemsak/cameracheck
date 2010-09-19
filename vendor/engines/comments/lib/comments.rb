require 'refinery'

module Refinery
  module Comments
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "comments"
          plugin.activity = {:class => Comment,}
        end
      end
    end
  end
end
