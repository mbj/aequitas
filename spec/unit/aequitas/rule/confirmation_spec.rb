require 'spec_helper'
require 'aequitas/rule/confirmation'

describe Aequitas::Rule::Confirmation do
  let(:rule) { Aequitas::Rule::Confirmation.new(attribute_name, options) }
  let(:attribute_name) { :foo }
  let(:options) { { } }

  describe '#type' do
    subject { rule.type }

    it('returns :confirmation') { assert_equal :confirmation, subject }
  end

end
