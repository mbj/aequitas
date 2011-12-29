# -*- encoding: utf-8 -*-

require 'aequitas/rule/value'

module Aequitas
  class Rule
    class Value
      class Range < Value

        def valid_value?(value)
          expected.cover?(value)
        end

        def violation_type(resource)
          :value_between
        end

        def violation_data(resource)
          [ [ :minimum, expected.begin ], [ :maximum, expected.end ] ]
        end

      end # class Range
    end # class Within
  end # class Rule
end # module Aequitas