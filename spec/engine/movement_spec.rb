# frozen_string_literal: true

require './lib/neptune/engine/movement'

RSpec.describe Engine::Movement do
  let(:x) { 4 }
  let(:y) { 2 }
  subject { Engine::Movement.new(x, y) }

  describe '#initialize' do
    it 'should set the x velocity' do
      expect(subject.x).to eq(x)
    end
    it 'should set the y velocity' do
      expect(subject.y).to eq(y)
    end
  end

  describe '#accelerate' do
    let(:x) { 0 }
    let(:y) { 0 }
    let(:angle) { 5 }
    let(:x_updated) { 25 }
    let(:y_updated) { 75 }
    it 'should update the x and y velocity' do
      expect(Gosu).to receive(:offset_x).with(angle, 0.5).and_return(x_updated)
      expect(Gosu).to receive(:offset_y).with(angle, 0.5).and_return(y_updated)
      subject.accelerate(angle)

      expect(subject.x).to eq(x_updated)
      expect(subject.y).to eq(y_updated)
    end
  end

  describe '#decelerate' do
    let(:x) { 1 }
    let(:y) { 1 }
    let(:x_updated) { 0.95 }
    let(:y_updated) { 0.95 }
    it 'should update the x and y velocity' do
      subject.decelerate

      expect(subject.x).to eq(x_updated)
      expect(subject.y).to eq(y_updated)
    end
  end
end
