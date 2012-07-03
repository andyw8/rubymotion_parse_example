# This class wraps PFUser to avoid coupling the app directly to the framework

class User
  def self.signed_in?
    # TODO add present? method to Object?
    !PFUser.currentUser.nil?
  end
end
