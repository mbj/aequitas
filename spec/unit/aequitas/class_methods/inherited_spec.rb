require 'spec_helper'
require 'aequitas/class_methods'


describe Aequitas::ClassMethods, '#inherited' do
  subject { descendant_class }

  let(:rule_a) { Aequitas::Rule::Nullary::Attribute::Presence.new(:foo) }
  let(:rule_b) { Aequitas::Rule::Nullary::Attribute::Presence.new(:bar) }

  let(:base_class) do 
    rule_a = self.rule_a
    Class.new do
      include Aequitas
      add(rule_a)
    end
  end

  let(:descendant_class) do 
    rule_b = self.rule_b
    Class.new(base_class) do
      add(rule_b)
    end
  end

  it 'copies the parents existing validation rules to the descendant' do
    subject.validator.should include(rule_a)
  end
end
