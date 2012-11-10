# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Length
      class Equal < self
        TYPE = :wrong_length

        equalize(:expected)

        attr_reader :expected

        # Initialize options
        #
        # @param [Symbol] attribute_name
        # @param [Hash] options
        #
        def initialize(attribute_name, options)
          super

          @expected = options.fetch(:expected)
        end

        # Return violation data
        #
        # @return [Array]
        #
        # @api private
        #
        def violation_data
          [ [ :expected, expected ] ]
        end

        # Validate the value length is equal to the expected length
        #
        # @param [Integer] length
        #   the value length
        #
        # @return [true]
        #   if length matches
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        def expected_length?(length)
          expected == length
        end

      end # class Equal
    end # class Length
  end # class Rule
end # module Aequitas
