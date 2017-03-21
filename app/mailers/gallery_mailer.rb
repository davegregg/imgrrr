class GalleryMailer < ApplicationMailer

  def share(recipient_name, recipient_email, gallery_url, current_user)
    @user = current_user
    @recipient_name = recipient_name
    @recipient_email = recipient_email
    @gallery_url = gallery_url
    mail(to: @recipient_email,
         subject: 'Someone has shared a gallery with you!')
  end

end
