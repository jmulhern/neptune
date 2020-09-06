# frozen_string_literal: true

require './lib/neptune/engine/asset'

RSpec.describe Engine::Asset do
  let(:path) { 'path/to/images/asset.png' }

  subject { Engine::Asset.new(path: path) }

  describe '#initialize' do
    it 'should set the path' do
      expect(subject.path).to eq(path)
    end
  end
end
