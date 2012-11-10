# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Value
      class GreaterThan < self
        TYPE = :greater_than

        def expected_value?(value)
          value > expected
        rescue ArgumentError
          # TODO: figure out better solution for: can't compare String with Integer
          true
        end

        def violation_data
          [ [ :minimum, expected ] ]
        end

      end # class GreaterThan
    end # class Value
  end # class Rule
end # module Aequitas
