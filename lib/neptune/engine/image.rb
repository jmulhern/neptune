# frozen_string_literal: true

require './lib/neptune/engine/asset'

module Engine
  class Image < Asset
    attr_reader :width, :height

    def initialize(path:, width:, height:)
      @width = width
      @height = height
      super(path: path)
    end
  end
end
