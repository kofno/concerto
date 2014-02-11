module Concerto

  class Audio

    attr_reader :window

    def initialize window
      @window = window

      load_audio_files
    end

    def load_audio_files
      @sounds = {
        beep: window.sample('Beep.wav'),
      }
    end

    def [] sym
      (@sounds || {})[sym]
    end

  end

end
