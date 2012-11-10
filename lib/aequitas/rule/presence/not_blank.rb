# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Presence
      class NotBlank < self
        TYPE = :blank

        def valid_value?(value)
          !Aequitas.blank?(value)
        end

      end # class NonNil
    end # class Presence
  end # class Rule
end # module Aequitas
