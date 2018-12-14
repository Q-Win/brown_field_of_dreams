class UserMailer < ApplicationMailer

  def email_confirmation(user, activation_token)
    @user = user
    @activation_token = activation_token

    mail to: user.email
  end

  def invite_email(user, email, github_user)
    @user = user
    @github_user = github_user

    mail to: email
  end
end
