##
# Apartment Configuration
Apartment.configure do |config|

  # these models will not be multi-tenanted,
  # but remain in the global (public) namespace
  config.excluded_models = %w{
    ActiveRecord::SessionStore::Session
    Option
    OptionsVenue
  }

  # use postgres schemas?
  config.use_postgres_schemas = true

  # configure persistent schemas (E.g. hstore )
  # config.persistent_schemas = %w{ hstore }

  # add the Rails environment to database names?
  # config.prepend_environment = true
  # config.append_environment = true

  # supply list of database names
  config.database_names = lambda{ Venue.scoped.collect(&:database) }

end

##
# Elevator Configuration

# Rails.application.config.middleware.use 'Apartment::Elevators::Domain'

Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'
