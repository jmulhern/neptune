# frozen_string_literal: true

require './lib/neptune/engine/image'

RSpec.describe Engine::Image do
  let(:path) { 'path/to/images/asset.png' }
  let(:width) { 256 }
  let(:height) { 512 }

  subject { Engine::Image.new(path: path, width: width, height: height) }

  describe '#initialize' do
    it 'should set the path' do
      expect(subject.path).to eq(path)
    end
    it 'should set the width' do
      expect(subject.width).to eq(width)
    end
    it 'should set the height' do
      expect(subject.height).to eq(height)
    end
  end
end
