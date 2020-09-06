# frozen_string_literal: true

require './lib/neptune/game/assets'

RSpec.describe Assets do
  describe '#images' do
    subject { Assets }

    it 'should return the path' do
      expect(subject.images(:background)).not_to be_nil
    end
  end
end
