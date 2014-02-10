module Concerto

  class RandomColor < Gosu::Color

    def initialize
      super 0xff000000
      self.red   = random_factor
      self.green = random_factor
      self.blue  = random_factor
    end

    def random_factor
      rand(256 - 40) + 40
    end
  end
end
