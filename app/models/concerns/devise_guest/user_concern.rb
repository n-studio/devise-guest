module DeviseGuest
  module UserConcern
    extend ActiveSupport::Concern

    included do
      belongs_to :owner_user, class_name: "User", optional: true
      has_many :guest_users, class_name: "User", foreign_key: :owner_user_id
    end
 
    module ClassMethods
    end

    def guest?
      guest
    end
  end
end