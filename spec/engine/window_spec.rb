# frozen_string_literal: true

require './lib/neptune/engine/window'

RSpec.describe Engine::Window do
  describe '#initialize' do
    let(:width) { 600 }
    let(:height) { 480 }
    let(:caption) { 'Super Neptune v0.0.0' }

    subject { Engine::Window.new(height: height, width: width, caption: caption) }

    it 'should create a window' do
      expect(subject).not_to be_nil
    end

    it 'should set the width' do
      expect(subject.width).to eq width
    end

    it 'should set the height' do
      expect(subject.height).to eq height
    end

    it 'should set the caption' do
      expect(subject.caption).to eq caption
    end
  end
end
