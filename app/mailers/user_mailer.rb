class UserMailer < ApplicationMailer

  def signup(recipient)
    @user = recipient
    mail(to: @user.email,
         subject: 'All of Imgrrr welcomes you!')
  end

  def share(recipient = {}, user, gallery)
    @user = user
    @recipient_name = recipient[:name]
    @gallery = gallery
    mail(to: recipient[:email],
         subject: "#{@recipient_name}, someone has shared a gallery with you!")
  end

end
