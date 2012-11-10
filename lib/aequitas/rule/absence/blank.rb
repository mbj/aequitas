# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Absence
      class Blank < self
        TYPE = :not_blank

        def valid_value?(value)
          Aequitas.blank?(value)
        end

      end # class Blank
    end # class Absence
  end # class Rule
end # module Aequitas
