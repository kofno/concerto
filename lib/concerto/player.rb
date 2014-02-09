module Concerto

  Player = Struct.new :window, :shape do

    def draw
      image.draw_rot position.x, position.y, ZOrder::PLAYER, angle.radians_to_gosu
    end

    def warp vect
      self.position = vect
    end

    def image
      @image ||= Gosu::Image.new window, Media['Starfighter.bmp'], false
    end

    def position
      shape.body.p
    end

    def position= vect
      shape.body.p = vect
    end

    def angle
      shape.body.a
    end

    def angle= radians
      shape.body.a = radians
    end

    def reorient
      self.angle = (3*Math::PI/2.0)
    end

    def accelerate
      shape.body.apply_force angle.radians_to_vec2 * acceleration, CP::Vec2.new(0.0, 0.0)
    end

    def acceleration
      1000.0/GameSpace::SUBSTEPS
    end

    def agility
      400.0/GameSpace::SUBSTEPS
    end

    def turn_left
      shape.body.t -= agility
    end

    def turn_right
      shape.body.t += agility
    end

    def reset_forces
      shape.body.reset_forces
    end

    def validate_position
      l_position = CP::Vec2.new position.x % window.width, position.y % window.height
      self.position = l_position
    end

  end
end
