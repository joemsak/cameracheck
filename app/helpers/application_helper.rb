# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
  include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.
  
  def camera_rules_for(venue)
    allowed, html = [], ""
    allowed << "Point & Shoot" if venue.allows_point_and_shoot
    allowed << "SLR" if venue.allows_slr
    allowed << "Flash" if venue.allows_flash
    
    allowed.each do |rule|
      html += "<li>#{rule} OK</li>"
    end
    
    return html
  end
  
  def selected?(venue)
    return venue == @venue ? "selected" : nil
  end
end
