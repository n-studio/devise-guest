module DeviseGuest
  module ApplicationConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_or_guest_user
    end

    module ClassMethods
    end

    # if user is logged in, return current_user, else return guest_user
    def current_or_guest_user
      if current_user
        if session[:guest_user_id] && session[:guest_user_id] != current_user.id
          if guest_user.owner_user_id.nil? && session[:merge_guest_user]
            current_user.guest_users << guest_user
            merge_guest_user_with_user(user: current_user, guest_user: guest_user)
          end
          if destroy_guest_if_login || session[:merge_guest_user]
            guest_user(false).try(:destroy)
          end
          session[:guest_user_id] = nil
        end
        current_user
      else
        guest_user
      end
    end

    def destroy_guest_if_login
      # override
      false
    end

    def merge_guest_user_with_user(user:, guest_user:)
      # override
    end

    # find guest_user object associated with the current session,
    # creating one as needed
    def guest_user(with_retry = true)
      # Cache the value the first time it's gotten.
      @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
      session[:guest_user_id] = nil
      guest_user if with_retry
    end

    private

    def create_guest_user
      domain = DeviseGuest.email_domain || "guest.example.com"
      user = User.create(email: "guest_#{Time.now.to_i}#{rand(100)}@#{domain}", guest: true)
      user.save!(validate: false)
      session[:guest_user_id] = user.id
      user
    end
  end
end
