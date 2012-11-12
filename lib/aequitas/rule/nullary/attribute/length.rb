#encoding: utf-8

module Aequitas
  class Rule
    class Nullary
      class Attribute

        # Rule that for length of attribute
        class Length < self
          TYPE = :length

          # Builder for length rule
          class Builder < Nullary::Builder
            OPTIONS = [:length, :minimum, :maximum]

          private

            # Return matcher
            #
            # @return [Matcher]
            #
            # @api private
            #
            def matcher
              assert_not_empty
              assert_no_conflict

              length || minmax || minimum || maximum
            end
            memoize :matcher

            # Return minmax matcher
            #
            # @return [Matcher]
            #   if :minimum and :maximum are present
            #
            # @return [nil]
            #   otherwise
            #
            # @api private
            #
            def minmax
              min, max = minimum, maximum

              if min and max
                return Machter::Binary::AND.new(min, max)
              end
            end
            memoize :minmax

            # Assert options are not in conflict
            #
            # @return [undefined]
            #
            # @raise
            #   if options are in conflict
            #
            # @api private
            #
            def assert_no_conflict
              if length and (minimum or maximum)
                raise ":length option is XOR to (:minimum or :maximum)"
              end
            end

            # Assert options are not empty
            #
            # @return [undefined]
            #
            # @raise
            #   if non option is given
            #
            # @api private
            #
            def assert_not_empty
              if options.empty?
                raise ":length, :maxmimum or :minimum must be given as option"
              end
            end

            # Return minium matcher
            #
            # @return [Matcher]
            #   if :minimum option is specified
            #
            # @return [nil]
            #   otherwise
            #
            # @api private
            #
            def minimum
              option = options.fetch(:minimum) { return }
              Matcher::Binary::OR.new(
                Matcher::Nullary::GreaterThan.new(option),
                Matcher::Nullary::Equality.new(option)
              )
            end
            memoize :minimum

            # Return maxmimum matcher
            #
            # @return [Matcher]
            #   if :maximum option is specified
            #
            # @return [nil]
            #   otherwise
            #
            # @api private
            #
            def maximum
              option = options.fetch(:maximum) { return }
              Matcher::Binary::OR.new(
                Matcher::Nullary::LessThan.new(option),
                Matcher::Nullary::Equality.new(option)
              )
            end
            memoize :maximum

            # Return length matcher
            #
            # @return [Matcher]
            #   if :length option is specified
            #
            # @return [nil]
            #   otherwise
            #
            # @api private
            #
            def length
              option = options.fetch(:length) { return }
              Matcher::Nullary::Value.build(option)
            end
            memoize :length
          end
          register :validates_length_of

          # Evaluator for length rules
          class Evaluator < Attribute::Evaluator

            # Test if value is valid
            #
            # @return [true] 
            #   if value is valid
            #
            # @return [false]
            #   otherwise
            #
            # @api private
            #
            def valid?
              matcher.matches?(length)
            end
            memoize :valid?

            # Return length
            #
            # @return [Fixnum]
            #
            # @api private
            #
            def length
              value.length
            end
            memoize :length

          end
        end 
      end 
    end 
  end
end
