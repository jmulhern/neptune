# frozen_string_literal: true

module Engine
  class Asset
    attr_reader :path

    def initialize(path:)
      @path = path
    end
  end
end
