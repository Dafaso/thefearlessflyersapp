class RiderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rider_mailer.signup.subject
  #
  def signup(rider)
    @rider = rider

    mail to: rider.email, subject: "Fearless Flyer Signup", bcc:[ENV["DAN_EMAIL"], ENV["ANDRE_EMAIL"], ENV["DIANY_EMAIL"]]
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rider_mailer.updates.subject
  #
  def updates(name, email, subject, body)
    @name = name
    @body = body

    mail to: email, subject: subject
  end
end
