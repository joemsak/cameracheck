# construct a client instance
YELP_CLIENT = Yelp::Client.new

class MustSetENVConfigYELP_WSID< Exception; end
raise MustSetENVConfigYELP_WSID unless key = ENV['YELP_WSID']
AddressLookup::Yelp.api_key = key
