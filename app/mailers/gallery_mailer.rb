class GalleryMailer < ApplicationMailer

  def share(recipient_name, recipient_email, gallery_url)
    @user = current_user
    @recipient_name = recipient_name
    @gallery_url = gallery_url

    mail(to: recipient_email,
         subject: 'Someone has shared a gallery with you!')
  end

end
