require_relative 'star_shape'
require_relative 'random_color'

module Concerto

  class Star

    attr_reader :window

    def initialize window, space
      @window = window

      space.add_shape shape
      space.add_body  shape.body

      random_position
      initial_veocity
      reorient
    end

    def shape
      @shape ||= StarShape.new
    end

    def draw
      frame.draw(
        position.x - frame.width / 2.0,
        position.y - frame.height / 2.0,
        ZOrder::STARS,
        Concerto::DEFAULT_SCALE_X,
        Concerto::DEFAULT_SCALE_Y,
        color,
        :additive,
      )
    end

    # Grabs the current frame of animation as an image.
    def frame
      animation[Gosu.milliseconds / 100 % animation.size]
    end

    def animation
      @@animation ||= Gosu::Image.load_tiles window, Media['Star.png'], 25, 25, false
    end

    def position
      shape.body.p
    end

    def position= a_vect
      shape.body.p = a_vect
    end

    def color
      @color ||= RandomColor.new
    end

    def random_position
      self.position = CP::Vec2.new(rand * window.width, rand * window.height)
    end

    def initial_veocity
      shape.body.v = CP::Vec2.new(0.0, 0.0)
    end

    def reorient
      shape.body.a = DEFAULT_ORIENTATION
    end
  end
end
