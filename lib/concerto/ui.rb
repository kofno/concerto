module Concerto

  class UI

    def initialize window, game
      @window = window
      @game   = game
    end

    def draw
      font.draw "Score: #{@game.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00
    end

    def font
      @font ||= Gosu::Font.new @window, Gosu.default_font_name, 20
    end
  end

end
