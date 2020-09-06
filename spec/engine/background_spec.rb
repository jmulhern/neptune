# frozen_string_literal: true

require './lib/neptune/engine/background'

RSpec.describe Engine::Background do
  let(:asset) { Engine::Image.new(path: '/path/to/background.png', width: 100, height: 200) }
  let(:gosu_image) { double }

  subject { Engine::Background.new(asset) }

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

  describe '#draw' do
    it 'should draw the background image' do
      expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)

      subject.draw
    end

    it 'should fill the min width' do
      expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
      expect(gosu_image).to receive(:draw).with(100, 0, 0, 1, 1)

      subject.draw(min_width: 200)
    end

    it 'should fill the min height' do
      expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
      expect(gosu_image).to receive(:draw).with(0, 200, 0, 1, 1)

      subject.draw(min_height: 300)
    end

    it 'should fill the min width and min height' do
      expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
      expect(gosu_image).to receive(:draw).with(0, 200, 0, 1, 1)
      expect(gosu_image).to receive(:draw).with(100, 0, 0, 1, 1)
      expect(gosu_image).to receive(:draw).with(100, 200, 0, 1, 1)

      subject.draw(min_width: 200, min_height: 300)
    end

    it 'should set the scale' do
      expect(gosu_image).to receive(:draw).with(0, 0, 0, 1.5, 1.5)

      subject.draw(scale: 1.5)
    end
  end
end
