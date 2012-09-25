module SignupViewControllerDelegate
  def signUpViewControlle(signUpController, didSignUpUser:user)
    dismissModalViewControllerAnimated true
  end

  def signUpViewControllerDidCancelSignUp(signUpController)
    dismissModalViewControllerAnimated true
  end
end
