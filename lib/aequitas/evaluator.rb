module Aequitas
  class Evaluator
    def initialize(context, rule)
      @context, @rule = context, rule
    end

      if evaluator.skip?
      value = attribute_value(context)

      if skip?(value) || valid_value?(value)
        nil
      else
        new_violation(context)
      end
  end
end
