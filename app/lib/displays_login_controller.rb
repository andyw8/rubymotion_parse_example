module DisplaysLoginController
  def display_login_controller
    options = PFLogInFieldsUsernameAndPassword |
      PFLogInFieldsLogInButton |
      PFLogInFieldsSignUpButton |
      PFLogInFieldsPasswordForgotten |
      PFLogInFieldsFacebook |
      PFLogInFieldsTwitter

    login_controller = PFLogInViewController.alloc.init.tap do |lc|
      lc.delegate = self
      lc.fields = options
    end

    presentViewController(login_controller, animated:true, completion:nil)
  end
end
