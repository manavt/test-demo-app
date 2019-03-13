class UserMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mail_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    attachments["lucid-roundup-TA.jpg"] = File.read("/Users/1228369/Desktop/backup/lucid-roundup-TA.jpg")
    mail(to: user.email, from: "xyz@gmail.com", subject: "Welcome Mr #{user.name} to Online shopping world")
  end
end
