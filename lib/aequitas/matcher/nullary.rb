module Aequitas
  class Matcher

    # Abstract base class for nullary matchers
    class Nullary < self

      # Matcher that matches blank values
      Aequitas.singleton_constant(self, :BLANK) do

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

      end
    end
  end
end
