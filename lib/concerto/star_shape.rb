module Concerto

  class StarShape < CP::Shape::Circle

    def initialize
      super body, 25/2, CP::Vec2.new(0.0, 0.0)
      self.collision_type = :star
    end

    def body
      @body ||= CP::Body.new 0.0001, 0.0001
    end

  end

end
