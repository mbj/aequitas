# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    # TODO: update this to inherit from Rule::Inclusion::Set
    class Acceptance < self
      TYPE = :accepted

      equalize(:accept)

      DEFAULT_ACCEPTED_VALUES = [ '1', 1, 'true', true, 't' ]

      attr_reader :accept

      def initialize(attribute_name, options = {})
        super

        @accept = Array(options.fetch(:accept, DEFAULT_ACCEPTED_VALUES)).to_set
      end

      def valid_value?(value)
        accept.include?(value)
      end

    end # class Acceptance
  end # class Rule
end # module Aequitas
