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

    it 'should set the location' do
      expect(subject.location.x).to eq(0)
      expect(subject.location.y).to eq(0)
    end
  end

  describe '#warp' do
    it 'should update the players location' do
      subject.warp(100, 200)
      expect(subject.location.x).to eq(100)
      expect(subject.location.y).to eq(200)
    end
  end

  describe '#turn_left' do
    it 'should decrement the angle' do
      subject.turn_left
      expect(subject.instance_variable_get(:@angle)).to eq(-1 * Engine::Player::TURN_FACTOR)
    end
  end

  describe '#turn_right' do
    it 'should increment the angle' do
      subject.turn_right
      expect(subject.instance_variable_get(:@angle)).to eq(Engine::Player::TURN_FACTOR)
    end
  end

  describe '#draw' do
    let(:image) { double('ship') }
    it 'should draw the player at the location' do
      subject.instance_variable_set(:@image, image)
      expect(image).to receive(:draw_rot).with(0.0, 0.0, 1, 0.0)
      subject.draw
    end
  end
end
