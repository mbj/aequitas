# -*- encoding: utf-8 -*-

require 'data_mapper/validations/validators/format'

module DataMapper
  module Validations
    module Validators
      module Format

        class Regexp < Validator

          include Format

          EQUALIZE_ON = superclass::EQUALIZE_ON.dup << :format_name << :format

          equalize *EQUALIZE_ON


          attr_reader :format_name

          def initialize(attribute_name, options = {})
            @format_name = options[:format_name]

            super(attribute_name, DataMapper::Ext::Hash.except(options, :format_name))
          end

          def valid?(value)
            # raise [self.class::EQUALIZE_ON, self].inspect
            return true if optional?(value)

            match_value = value.kind_of?(Numeric) ? value.to_s : value
            match_value =~ self.format
          rescue ::Encoding::CompatibilityError
            # This is to work around a bug in jruby - see formats/email.rb
            false
          end

          def error_message_args
            [ :invalid, attribute_name ]
          end

          # TODO: integrate format into error message key?
          # def error_message_args
          #   if format.is_a?(Symbol)
          #     [ :"invalid_#{format}", attribute_name ]
          #   else
          #     [ :invalid, attribute_name ]
          #   end
          # end

        end # class Regexp

      end # module Format
    end # module Validators
  end # module Validations
end # module DataMapper