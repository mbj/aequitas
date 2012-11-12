# -*- encoding: utf-8 -*-

module Aequitas

  # Abstract base class for resource rules
  class Rule
    include AbstractClass, Adamantium::Flat

    # Return evaluator for resource
    # 
    # @param [Object] resource
    #   the target object to be validated
    # 
    # @return [Evaluator]
    #
    # @api private
    #
    def evaluate(resource)
      evaluator.new(self, resource)
    end

    # Return violations for resource
    #
    # @param [Resource] resource
    #
    # @return [Enumerable<Violations>]
    #
    def violations(resource)
      evaluate(resource).violations
    end

    # Return evaluator
    #
    # @return [Class:Evaluator]
    #
    # @api private
    #
    def evaluator
      self.class::Evaluator
    end

    # Return symbolic type of rule
    #
    # @return [Symbol]
    #
    # @api private
    #
    def type
      self.class::TYPE
    end

  end # class Rule
end # module Aequitas
