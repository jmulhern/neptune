# frozen_string_literal: true

RSpec.describe Neptune do

  subject { Neptune }

  it 'has a version number' do
    expect(subject::VERSION).not_to be_nil
  end

  describe '#init' do
    let(:window) { double }

    it 'should call the show method on the window' do
      expect(Window).to receive(:new).and_return(window)
      expect(window).to receive(:show)

      subject.init
    end
  end
end
