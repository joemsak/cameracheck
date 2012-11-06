class MustSetENVConfigYELP_WSID < Exception; end

raise MustSetENVConfigYELP_WSID unless key = ENV['YELP_WSID']

subdomain = 'nyc'
origins   = { 'nyc'     => { :city => 'New York', :state => 'NY' },
              'chicago' => { :city => 'Chicago',  :state => 'IL' } }

AddressLookup::Yelp.api_key        = key
AddressLookup::Yelp.origin_city    = origins[subdomain][:city]
AddressLookup::Yelp.origin_state   = origins[subdomain][:state]
AddressLookup::Yelp.client         = Yelp::Client.new
