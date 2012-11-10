# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Inclusion < self
      TYPE = :inclusion

      equalize(:set)

      attr_reader :set

      def initialize(attribute_name, options={})
        super

        @set = options.fetch(:within)
      end

      def valid_value?(value)
        set.include?(value)
      end

      # TODO: is it worth converting to a String (dumping this information)?
      def violation_data
        [ [ :within, set.to_a.join(', ') ] ]
      end

    end # class Inclusion
  end # class Rule
end # module Aequitas
