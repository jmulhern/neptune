# frozen_string_literal: true

require './lib/neptune/game/window'

RSpec.describe Window do
  subject { Window.new }

  describe '#initialize' do
    it 'should create a window' do
      expect(subject).not_to be_nil
    end
  end

  describe '#draw' do
    let(:background) { double }
    before do
      subject.instance_variable_set(:@background, background)
    end
    it 'should draw the background' do
      expect(background).to receive(:draw)

      subject.draw
    end
  end
end
