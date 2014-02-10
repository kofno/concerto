require 'gosu'
require 'chipmunk'
require 'pathname'
require 'concerto/core_ext/numeric'

module Concerto

  ROOT_PATH = Pathname.new(File.expand_path('../..', __FILE__))

  # Default X coord image scaling. Using this value instead of just '1' adds
  # clarity.
  DEFAULT_SCALE_X = 1

  # Default Y coord image scaling. Using this value instead of just '1' adds
  # clarity.
  DEFAULT_SCALE_Y = 1

  DEFAULT_ORIENTATION = (3*Math::PI/2.0)
end

require 'concerto/game_window'
