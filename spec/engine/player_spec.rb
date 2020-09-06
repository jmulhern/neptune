# frozen_string_literal: true

require './lib/neptune/engine/player'

RSpec.describe Engine::Player do
  let(:asset) { Engine::Image.new(path: '/path/to/ship.png', width: 128, height: 64) }
  let(:gosu_image) { double }

  subject { Engine::Player.new(asset) }

  before do
    allow(Gosu::Image).to receive(:new).and_return(gosu_image)
  end

  describe '#initialize' do
    it 'should create a window' do
      expect(subject).not_to be_nil
    end

    it 'should set the asset' do
      expect(subject.asset).to eq(asset)
    end

    it 'should set the image' do
      expect(subject.image).to eq(gosu_image)
    end
  end
end
