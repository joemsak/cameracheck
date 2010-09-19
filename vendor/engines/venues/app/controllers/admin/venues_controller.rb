class Admin::VenuesController < Admin::BaseController

  crudify :venue, :title_attribute => 'name'


end
