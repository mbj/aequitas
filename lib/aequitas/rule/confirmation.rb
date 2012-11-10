# -*- encoding: utf-8 -*-

module Aequitas
  class Rule
    class Confirmation < Rule
      TYPE = :confirmation

      equalize(:confirmation_attribute_name)

      attr_reader :confirmation_attribute_name

      def initialize(attribute_name, options = {})
        super

        @confirmation_attribute_name = options.fetch(:confirm) do
          :"#{attribute_name}_confirmation"
        end
      end

      def validate(resource)
        value = attribute_value(resource)

        if value == confirmation_value(resource)
          nil
        else
          new_violation(resource)
        end
      end

      def confirmation_value(resource)
        resource.validation_attribute_value(@confirmation_attribute_name)
      end

    end # class Confirmation
  end # class Rule
end # module Aequitas
