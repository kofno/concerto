module Concerto

  class PlayerShape < CP::Shape::Poly

    def initialize
      super body, shape_array, CP::Vec2.new(0, 0)
      self.collision_type = :player
    end

    def shape_array
      [
        CP::Vec2.new(-25.0, -25.0),
        CP::Vec2.new(-25.0,  25.0),
        CP::Vec2.new(25.0,    1.0),
        CP::Vec2.new(25.0,   -1.0),
      ]
    end

    def body
      @body ||= CP::Body.new 10.0, 150.0
    end
  end

end
