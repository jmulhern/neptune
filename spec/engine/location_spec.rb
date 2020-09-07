# frozen_string_literal: true

require './lib/neptune/engine/location'

RSpec.describe Engine::Location do
  let(:x) { 10 }
  let(:y) { 20 }
  subject { Engine::Location.new(x, y) }

  describe '#initialize' do
    it 'should set the x position' do
      expect(subject.x).to eq(x)
    end
    it 'should set the y position' do
      expect(subject.y).to eq(y)
    end
  end
end
