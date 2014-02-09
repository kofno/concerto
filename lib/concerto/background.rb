require_relative 'media'
require_relative 'zorder'

module Concerto

  Background = Struct.new(:window) do

    def draw
      image.draw 0, 0, ZOrder::BACKGROUND
    end

    def image
      @image ||= Gosu::Image.new(window, Media['Space.png'], true)
    end

  end

end
