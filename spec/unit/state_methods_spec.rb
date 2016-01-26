require 'spec_helper'

describe "per-transition guards" do
  let(:car) { StateMethods.new }

  it "allows the user to define per method states on the includer class" do
    expect(car).to respond_to(:speed)
    expect(car.stopped?).to eq true
    expect(car.speed).to eq 0
  end

  it 'changes the method when state changes' do
    car
    require 'byebug'; byebug
    car.accelerate
    expect(car.stopped?).to eq false



    expect(car.speed).to eq 100
  end

  # it 'returns the value of speed' do
  # end
end
