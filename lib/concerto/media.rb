module Concerto

  class Media

    def self.[] name
      Concerto::ROOT_PATH.join('media', name).to_s
    end

  end
end
