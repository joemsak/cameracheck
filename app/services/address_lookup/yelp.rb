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

      def request(options = {})
        options = default_options.merge(options)
        request = ::Yelp::V1::Review::Request::Location.new(options)
      end

      private
      def city
        "New York"
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

    def find_address_by(field)
      term     = send(field)
      request  = self.class.request(:term => term)
      response = Yelp.client.search(request)

      if business = response['businesses'].first
        build_address(business)
      end
    end

    def address_should_be_built?
      address.blank? and not lookup_field_value.blank?
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
