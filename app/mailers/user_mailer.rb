class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: @user.email,
         subject: "Congratulations, we can now spam you!")
  end

end
