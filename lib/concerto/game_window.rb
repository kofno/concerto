require_relative 'background'
require_relative 'game_space'
require_relative 'player'
require_relative 'star'

module Concerto

  class GameWindow < Gosu::Window

    SCREEN_HEIGHT = 640
    SCREEN_WIDTH  = 480

    attr_reader :space

    def initialize
      super SCREEN_HEIGHT, SCREEN_WIDTH, false
      self.caption = "Concerto: A Space Opera in B♭"
      @space = GameSpace.new

      player.warp CP::Vec2.new(SCREEN_HEIGHT/2, SCREEN_WIDTH/2)
      player.reorient
    end

    def update
      space.update do

        player.reset_forces
        player.validate_position
        player.turn_left  if [Gosu::KbLeft, Gosu::GpLeft].any?   { |k| button_down? k }
        player.turn_right if [Gosu::KbRight, Gosu::GpRight].any? { |k| button_down? k }
        player.accelerate if [Gosu::KbUp, Gosu::GpButton0].any?  { |k| button_down? k }

      end

      stars << Star.new(self, space) if rand(100) < 4 and stars.size < 25
    end

    def draw
      background.draw
      player.draw
      stars.each(&:draw)
    end

    def background
      @background ||= Background.new(self)
    end

    def player
      @player ||= Player.new self, space
    end

    def stars
      @stars ||= []
    end
  end

end
