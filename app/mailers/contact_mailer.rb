class ContactMailer < ApplicationMailer
  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, subject: "お問い合わせについて【自動送信】"
  end
end
