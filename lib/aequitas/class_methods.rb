# -*- encoding: utf-8 -*-


module Aequitas
  # Class methods mixed into aequitas validators
  module ClassMethods
    include DSL

    # Return the validator
    #
    # @return [Validator]
    #
    # @api private
    #
    def validator
      @validator ||= Validator::EMPTY
    end


    # Add a rule
    #
    # @param [Rule] rule
    #
    # @return [self]
    #
    # @api private
    #
    def add(rule)
      @validator = validator.add(rule)
    end

    # Return violations for resource
    #
    # @param [Resource] resource
    #
    # @return [Evaluation]
    #
    # @api private
    #
    def validate(resource)
      validator.validate(resource)
    end

    # Return rules for attribute
    #
    # @param [Symbol] attribute_name
    #
    # @return [Enumerable<Rule>]
    #
    # @api private
    #
    def on(attribute_name)
      validator.on(attribute_name)
    end

  private

    # Hook called when module is included
    #
    # @param [Class|Module] descendant
    #
    # @api private
    #
    def inherited(descendant)
      super
      validator.each do |rule|
        descendant.add(rule)
      end
    end

  end # module ClassMethods
end # module Aequitas
