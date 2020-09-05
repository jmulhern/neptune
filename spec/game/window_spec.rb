# frozen_string_literal: true

require './lib/neptune/game/window'

RSpec.describe Window do
  describe '#initialize' do
    subject { Window.new }

    it 'should create a window' do
      expect(subject).not_to be_nil
    end
  end
end
