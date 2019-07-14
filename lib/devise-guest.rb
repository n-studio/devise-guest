require "devise-guest/engine"

module DeviseGuest
  class << self
    def setup
      yield self
    end

    attr_accessor :email_domain
  end
end
