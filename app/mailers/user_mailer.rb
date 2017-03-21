class UserMailer < ApplicationMailer

  def signup(recipient)
    @user = recipient
    mail(to: @user.email,
         subject: 'All of Imgrrr welcomes you!')
  end

end
