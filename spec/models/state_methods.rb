class StateMethods
  include AASM

  aasm do

    state :stopped, foo: :bar, baz: :derp, :initial => true do
      def speed
        0
      end
    end

    state :cruising do
      def speed
        100
      end
    end

    state :scrapped

    event :accelerate do
      transitions :from => :stopped, :to => :cruising, :guard => :gas_in_tank?
    end

    event :brake do
      transitions :from => :cruising, :to => :stopped
    end

    event :crash do
      transitions :from => :cruising, :to => :totaled
    end
  end

  def gas_in_tank?; true; end
end
