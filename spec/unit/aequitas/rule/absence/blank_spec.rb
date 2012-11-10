require 'spec_helper'
require 'aequitas/rule/absence/blank'

describe Aequitas::Rule::Absence::Blank do
  let(:rule) { Aequitas::Rule::Absence::Blank.new(attribute_name, options) }
  let(:attribute_name) { :foo }
  let(:options) { Hash.new }

  describe '#type' do
    subject { rule.type }

    it('returns :absent') { assert_equal :not_blank, subject }
  end

end
