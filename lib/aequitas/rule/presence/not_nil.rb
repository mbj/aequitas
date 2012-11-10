# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Presence
      class NotNil < self
        TYPE = :nil

        def valid_value?(value)
          self.class.valid_value?(value)
        end

        def self.valid_value?(value)
          !value.nil?
        end

      end # class NonNil
    end # class Presence
  end # class Rule
end # module Aequitas
