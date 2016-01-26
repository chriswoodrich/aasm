module AASM
  class StateMethod
    @@methods = {}

    def initialize(state_name, method)
      @@methods[state_name] = method
    end

    def self.undefine_state_method(klass, state_name)
      klass.class.send(:remove_method, @@methods[state_name].name)
    end

    def self.define_state_method(klass, state_name)
      new_method = @@methods[state_name]

      klass.instance_eval do
        eval "def #{new_method.name}; #{new_method.call}; end"
      end
    end
  end
end
