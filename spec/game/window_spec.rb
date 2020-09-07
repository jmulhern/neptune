# frozen_string_literal: true

require './lib/neptune/game/window'

RSpec.describe Window do
  subject { Window.new }

  describe '#initialize' do
    it 'should create a window' do
      expect(subject).not_to be_nil
    end

    it 'should create a background' do
      expect(subject.instance_variable_get(:@background)).not_to be_nil
    end
    it 'should create a player' do
      expect(subject.instance_variable_get(:@player)).not_to be_nil
    end
  end

  describe '#update' do
    let(:player) { double }
    before do
      subject.instance_variable_set(:@player, player)
      allow(Engine::Input).to receive(:left?).and_return(false)
      allow(Engine::Input).to receive(:right?).and_return(false)
    end

    context 'when the left input is given' do
      it 'should turn the player to the left' do
        expect(Engine::Input).to receive(:left?).and_return(true)
        expect(player).to receive(:turn_left)

        subject.update
      end
    end

    context 'when the right input is given' do
      it 'should turn the player to the right' do
        expect(Engine::Input).to receive(:right?).and_return(true)
        expect(player).to receive(:turn_right)

        subject.update
      end
    end
  end

  describe '#draw' do
    let(:player) { double }
    let(:background) { double }
    before do
      subject.instance_variable_set(:@player, player)
      subject.instance_variable_set(:@background, background)
    end
    it 'should draw the scene' do
      expect(player).to receive(:draw)
      expect(background).to receive(:draw)

      subject.draw
    end
  end
end
