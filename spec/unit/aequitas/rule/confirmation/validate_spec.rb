require 'spec_helper'
require 'aequitas/rule/confirmation'

describe Aequitas::Rule::Confirmation, '#validate' do
  subject { rule.validate(context) }

  let(:rule) { Aequitas::Rule::Confirmation.new(attribute_name, options) }
  let(:attribute_name) { :foo }
  let(:options) { { } }

  # Will be gone once we port this to rspec2
  class MockContext
    def initialize(attribute_name, attribute_value, confirmation_attribute_name, confirmation_attribute_value)
      @attribute_name, @attribute_value = attribute_name, attribute_value
      @confirmation_attribute_name, @confirmation_attribute_value = confirmation_attribute_name, confirmation_attribute_value
    end

    def validation_attribute_value(attribute_name)
      if attribute_name == @attribute_name
        @attribute_value
      elsif attribute_name == @confirmation_attribute_name
        @confirmation_attribute_value
      else
        raise
      end
    end
  end

  let(:options)         { { } }
  let(:context)         { MockContext.new(attribute_name, attribute_value, confirmation_attribute_name, confirmation_attribute_value) }
  let(:attribute_value) { :bar }

  let(:confirmation_attribute_name)  { rule.confirmation_attribute_name }
  let(:confirmation_attribute_value) { Object.new }

  describe 'and the value equals the confirmation value' do
    let(:confirmation_attribute_value) { attribute_value }

    it('returns nil') { assert_equal nil, subject }
  end

  describe 'and the value does not equal the confirmation value' do
    let(:expected_violation) do
      Aequitas::Violation.new(context, rule)
    end

    it('returns a Violation') { assert_equal expected_violation, subject }
  end
end
