# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class PrimitiveType < self
      TYPE = :primitive

      attr_reader :primitive

      def initialize(attribute_name, options = {})
        super

        @primitive = options.fetch(:primitive)
      end

      # Test if value is valid
      #
      # @return [true]
      #   if value is valid
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def valid_value?(value)
        expected_type?(value)
      end

      # Test if value has expected type
      #
      # @return [true]
      #   if value has expected type
      #
      # @return [false]
      #   otherwise
      #
      # @api private
      #
      def expected_type?(value)
        value.is_a?(primitive)
      end

      # Return violation data
      #
      # @return [Array]
      #
      # @api private
      #
      def violation_data
        [ [ :primitive, primitive ] ]
      end

    end # class PrimitiveType
  end # class Rule
end # module Aequitas
