# frozen_string_literal: true

require './lib/neptune/engine/input'

RSpec.describe Engine::Input do
  subject { Engine::Input }
  before do
    allow(Gosu).to receive(:button_down?).with(Gosu::KB_LEFT).and_return(false)
    allow(Gosu).to receive(:button_down?).with(Gosu::GP_LEFT).and_return(false)
    allow(Gosu).to receive(:button_down?).with(Gosu::KB_RIGHT).and_return(false)
    allow(Gosu).to receive(:button_down?).with(Gosu::GP_RIGHT).and_return(false)
    allow(Gosu).to receive(:button_down?).with(Gosu::KB_UP).and_return(false)
    allow(Gosu).to receive(:button_down?).with(Gosu::GP_UP).and_return(false)
  end

  describe '#left?' do
    it 'should return false' do
      expect(subject.left?).to be_falsey
    end

    context 'when the left keyboard key is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KB_LEFT).and_return(true)

        expect(subject.left?).to be_truthy
      end
    end

    context 'when the left gamepad button is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::GP_LEFT).and_return(true)

        expect(subject.left?).to be_truthy
      end
    end
  end

  describe '#right?' do
    it 'should return false' do
      expect(subject.right?).to be_falsey
    end

    context 'when the right keyboard key is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KB_RIGHT).and_return(true)

        expect(subject.right?).to be_truthy
      end
    end

    context 'when the right gamepad button is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::GP_RIGHT).and_return(true)

        expect(subject.right?).to be_truthy
      end
    end
  end

  describe '#up?' do
    it 'should return false' do
      expect(subject.up?).to be_falsey
    end

    context 'when the up keyboard key is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KB_UP).and_return(true)

        expect(subject.up?).to be_truthy
      end
    end

    context 'when the up gamepad button is pressed' do
      it 'should return true' do
        expect(Gosu).to receive(:button_down?).with(Gosu::GP_UP).and_return(true)

        expect(subject.up?).to be_truthy
      end
    end
  end
end
