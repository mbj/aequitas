# -*- encoding: utf-8 -*-

module Aequitas
  class Violation
    include Adamantium::Flat, Equalizer.new(:context, :rule)

    # Return object validated in this violation
    #
    # @return [Object]
    # 
    # @api private
    #
    attr_reader :context

    # Rule which generated this Violation
    #
    # @return [Aequitas::Rule]
    #
    # @api private
    #
    attr_reader :rule

    # Name of the attribute which this Violation pertains to
    #
    # @return [Symbol]
    #   the name of the validated attribute associated with this violation
    #
    # @api public
    #
    def attribute_name
      rule.attribute_name
    end

    # Return symbolic type of rule
    #
    # @return [Symbol]
    #
    # @api private
    #
    def type
      rule.type
    end

    # Return violation info
    #
    # @return [Hash]
    #
    # @api private
    #
    def info
      rule.violation_info.merge(:value => @value)
    end
    memoize :info

    # Return Violation values
    #
    # @return [Object]
    #
    # @api private
    #
    def values
      rule.violation_values
    end

  private

    # Initialize object
    # 
    # @param [Object] context
    #   the validated object
    #
    # @param [Rule] rule
    #   the rule that was violated
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(context, rule)
      @context  = context
      @rule     = rule
    end
  end # class Violation
end # module Aequitas
