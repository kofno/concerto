require_relative 'player_shape'

module Concerto

  class GameSpace < CP::Space

    # Number of physics updates per screen updates
    SUBSTEPS = 6

    attr_reader :delta_t
    attr_accessor :score, :audio

    def initialize
      super

      self.damping = 0.8
      @delta_t     = 1.0 / 60.0
      @score       = 0

      add_collision_funcs
    end

    def update
      SUBSTEPS.times do

        remove_collided_stars

        yield if block_given?

        step delta_t
      end
    end

    def add_collision_funcs
      add_player_to_star_collision_func
      add_star_to_star_collision_func
    end

    def add_player_to_star_collision_func
      add_collision_func :player, :star do |player, star|
        self.score += 10
        audio[:beep].play
        self.collided_stars << star
      end
    end

    # Stars bumping together do nothing
    def add_star_to_star_collision_func
      add_collision_func :star, :star, &nil
    end

    def my_god_its_full_of_stars?
      stars.size > 25
    end

    def stars
      @stars ||= []
    end

    def add_star window
      self.stars << Star.new(window).tap { |s|
        add_shape s.shape
        add_body  s.shape.body
      }
    end

    def collided_stars
      @collided_stars ||= []
    end

    def remove_collided_stars
      collided_stars.each do |shape|
        stars.delete_if { |star| star.shape == shape }
        remove_body shape.body
        remove_shape shape
      end
      collided_stars.clear
    end

  end

end
