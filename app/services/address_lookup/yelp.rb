module AddressLookup
  module Yelp
    mattr_accessor :api_key, :client

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def lookup_address_by(field)
        before_validation do
          if address.blank? && !send(field).blank?
            self.address = find_address_by(field)
          end
        end
      end

      def request(options = {})
        options = default_options.merge(options)
        request = ::Yelp::V1::Review::Request::Location.new(options)
      end

      private
      def city
        "New York"
      end

      def state
        "NY"
      end

      def default_options
        { :city   => city,
          :state  => state,
          :radius => 2,
          :term   => nil,
          :yws_id => Yelp.api_key }
      end
    end

    def find_address_by(field)
      term     = send(field)
      request  = self.class.request(:term => term)
      response = Yelp.client.search(request)

      if business = response['businesses'].first
        build_address(business)
      end
    end

    private
    def build_address(business)
      %w(address1 address2 city state zip).map do |attr|
        value = business[attr]
        value << "," if attr == 'city'
        value
      end.join(' ')
    end
  end
end
