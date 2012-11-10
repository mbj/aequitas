# -*- encoding: utf-8 -*-

require 'backports'
require 'bigdecimal'
require 'bigdecimal/util'
require 'forwardable'
require 'adamantium'
require 'equalizer'
require 'abstract_class'

# Library namespace
module Aequitas

  # Hook called when module is included
  #
  # @param [Class|Module] descendant
  #
  # @return [undefined]
  #
  # @api private
  #
  def self.included(descendant)
    super
    descendant.class_eval do
      include ::Adamantium::Flat
      include InstanceMethods
    end
    descendant.extend(ClassMethods)
  end

end 

require 'aequitas/support/blank'
require 'aequitas/macros'
require 'aequitas/class_methods'
require 'aequitas/instance_methods'
require 'aequitas/rule_set'
require 'aequitas/exceptions'
require 'aequitas/guard'
require 'aequitas/rule'
require 'aequitas/rule/absence'
require 'aequitas/rule/absence/blank'
require 'aequitas/rule/absence/nil'
require 'aequitas/rule/acceptance'
require 'aequitas/rule/confirmation'
require 'aequitas/rule/format'
require 'aequitas/rule/format/email_address'
require 'aequitas/rule/format/proc'
require 'aequitas/rule/format/regexp'
require 'aequitas/rule/format/url'
require 'aequitas/rule/length'
require 'aequitas/rule/length/equal'
require 'aequitas/rule/length/maximum'
require 'aequitas/rule/length/minimum'
require 'aequitas/rule/length/range'
require 'aequitas/rule/numericalness'
require 'aequitas/rule/numericalness/integer'
require 'aequitas/rule/numericalness/non_integer'
require 'aequitas/rule/presence'
require 'aequitas/rule/presence/not_blank'
require 'aequitas/rule/presence/not_nil'
require 'aequitas/rule/primitive_type'
require 'aequitas/rule/value'
require 'aequitas/rule/value/equal'
require 'aequitas/rule/value/greater_than'
require 'aequitas/rule/value/greater_than_or_equal'
require 'aequitas/rule/value/less_than'
require 'aequitas/rule/value/less_than_or_equal'
require 'aequitas/rule/value/not_equal'
require 'aequitas/rule/value/range'
require 'aequitas/rule/inclusion'
require 'aequitas/rule_set'
require 'aequitas/version'
require 'aequitas/violation'
require 'aequitas/violation_set'
