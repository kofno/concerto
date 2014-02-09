require 'gosu'
require 'chipmunk'
require 'pathname'
require 'concerto/core_ext/numeric'

module Concerto

  ROOT_PATH = Pathname.new(File.expand_path('../..', __FILE__))

end

require 'concerto/game_window'
