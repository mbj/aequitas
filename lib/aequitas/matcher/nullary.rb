module Aequitas
  class Matcher

    # Abstract base class for nullary matchers
    class Nullary < self

      # Matcher that matches blank values
      BLANK = Class.new(self) do

        # Return inspectable string 
        #
        # @return [String]
        #
        # @api private
        #
        def inspect; "#{self.class.superclass}::BLANK".freeze; end

        # Test if value is blank
        #
        # @return [true]
        #   if value is blank
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def matches?(value)
          Aequitas.blank?(value)
        end

      end.new
    end
  end
end
