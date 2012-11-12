# -*- encoding: utf-8 -*-

module Aequitas
  # Mixin for the Aequitas dsl
  module DSL

    # Register macro
    #
    # @param [Symbol] name
    #
    # @param [Class] klass
    #
    # @return [self]
    #
    # @api private
    #
    def self.register(name, klass)
      registry[name] = klass
      self
    end

    # Return registry
    # 
    # @return [Hash]
    #
    # @api private
    # 
    def self.registry
      @registry ||= {}
    end

    # Lookup dsl name
    #
    # @param [Symbol] name
    #
    # @return [Class]
    #   if found
    #
    # @yield
    #   otherwise
    #
    # @api private
    #
    def self.lookup(name)
      registry.fetch(name) { yield }
    end

    # Hook called when method is missing
    #
    # @param [Symbol] name
    #
    # @return [self]
    #
    # @api private
    #
    def method_missing(name, *args)
      klass = DSL.lookup(name) { super }

      klass.run(args).each do |rule|
        add(rule)
      end

      self
    end

  end # module Macros
end # module Aequitas
