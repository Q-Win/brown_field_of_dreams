class UserMailer < ApplicationMailer

  def email_confirmation(user, activation_token)
    @user = user
    @activation_token = activation_token 

    mail to: user.email
  end
end
