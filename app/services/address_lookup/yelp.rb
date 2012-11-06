module AddressLookup
  module Yelp
    mattr_accessor :api_key, :client, :origin_city, :origin_state

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def lookup_address_by(field)
        before_validation do
          @lookup_field = field
          build_address if address_should_be_built?
        end
      end
    end

    # public instance methods

    def build_address(term = lookup_field_value)
      request  = Yelp.request(:term => term)
      response = Yelp.client.search(request)

      if business = response['businesses'].first
        self.address = address_of(business)
      end
    end

    class << self
      def request(options = {})
        options = default_options.merge(options)
        request = ::Yelp::V1::Review::Request::Location.new(options)
      end

      def default_options
        { :city   => origin_city,
          :state  => origin_state,
          :radius => 2,
          :term   => nil,
          :yws_id => api_key }
      end
    end

    private
    def address_of(business)
      address_parts.map { |attr|
        v = business[attr]
        value = v.blank? ? nil : v
        value << ',' if attr == 'city'
        value
      }.compact.join(' ')
    end

    def address_should_be_built?
      address.blank? and not lookup_field_value.blank?
    end

    def address_parts
      %w(address1 address2 city state zip)
    end

    def lookup_field_value
      @lookup_field_value ||= send(lookup_field)
      return nil if @lookup_field_value.blank?
      @lookup_field_value
    end

    def lookup_field
      @lookup_field
    end
  end
end
