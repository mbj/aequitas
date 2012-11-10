# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Absence
      class Nil < self
        TYPE = :not_nil

        def valid_value?(value)
          self.class.valid_value?(value)
        end

        def self.valid_value?(value)
          value.nil?
        end

      end # class Nil
    end # class Absence
  end # class Rule
end # module Aequitas
