# frozen_string_literal: true

require './lib/neptune/engine/background'

RSpec.describe Engine::Background do
  let(:asset_width) { 100 }
  let(:asset_height) { 200 }
  let(:asset) { Engine::Image.new(path: '/path/to/background.png', width: asset_width, height: asset_height) }
  let(:min_width) { 0 }
  let(:min_height) { 0 }
  let(:z_index) { 0 }
  let(:scale) { 1 }
  let(:gosu_image) { double }

  subject { Engine::Background.new(asset, min_width: min_width, min_height: min_height, z_index: z_index, scale: scale) }

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
    context 'when attributes are set to default values' do
      it 'should draw the background image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)

        subject.draw
      end
    end

    context 'when the min width is greater than the asset width' do
      let(:asset_width) { 200 }
      let(:min_width) { asset_width * 2 }
      it 'should draw the image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
        expect(gosu_image).to receive(:draw).with(asset_width, 0, 0, 1, 1)

        subject.draw
      end
    end

    context 'when the min height is greater than the asset height' do
      let(:asset_height) { 200 }
      let(:min_height) { asset_height + 1 }
      it 'should draw the image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
        expect(gosu_image).to receive(:draw).with(0, asset_height, 0, 1, 1)

        subject.draw
      end
    end

    context 'when the min height and min width are greater than the asset height and width' do
      let(:asset_width) { 200 }
      let(:min_width) { asset_height + 1 }
      let(:asset_height) { 200 }
      let(:min_height) { asset_height + 1 }
      it 'should draw the image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 0, 1, 1)
        expect(gosu_image).to receive(:draw).with(0, asset_height, 0, 1, 1)
        expect(gosu_image).to receive(:draw).with(asset_width, 0, 0, 1, 1)
        expect(gosu_image).to receive(:draw).with(asset_width, asset_height, 0, 1, 1)

        subject.draw
      end
    end

    context 'when the scale is set' do
      let(:scale) { 2 }
      it 'should draw the image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 0, 2, 2)

        subject.draw
      end
    end

    context 'when the z index is set' do
      let(:z_index) { 2 }
      it 'should draw the image' do
        expect(gosu_image).to receive(:draw).with(0, 0, 2, 1, 1)

        subject.draw
      end
    end
  end
end
