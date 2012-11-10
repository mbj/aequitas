# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Numericalness
      class Integer < self
        TYPE = :not_an_integer

        def expected
          /\A[+-]?\d+\z/
        end

      end # class Equal
    end # class Numericalness
  end # class Rule
end # module Aequitas
