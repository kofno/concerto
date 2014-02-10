require_relative 'player_shape'

module Concerto

  class GameSpace < CP::Space

    # Number of physics updates per screen updates
    SUBSTEPS = 6

    attr_reader :delta_t

    def initialize
      super
      self.damping = 0.8
      @delta_t = 1.0 / 60.0
    end

    def update
      SUBSTEPS.times do

        yield if block_given?

        step delta_t
      end
    end

  end

end
