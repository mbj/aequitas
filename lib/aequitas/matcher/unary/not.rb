module Aequitas
  class Matcher
    class Unary

      # Boolean not matcher
      class Not < self

        # Return inverse of operand
        #
        # @return [true]
        #   if operand returns false
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def matches?(value)
          !operand_matches?(value)
        end

      end
    end
  end
end
