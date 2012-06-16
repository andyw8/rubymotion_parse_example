module SignupViewControllerDelegate
  def signUpViewControlle(signUpController, didSignUpUser:user)
    puts "*1"
    dismissModalViewControllerAnimated true 
  end

  def signUpViewControllerDidCancelSignUp(signUpController)
    puts "*2"
    dismissModalViewControllerAnimated true
  end
end
