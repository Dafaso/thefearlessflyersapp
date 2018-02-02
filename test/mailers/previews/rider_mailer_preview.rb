# Preview all emails at http://localhost:3000/rails/mailers/rider_mailer
class RiderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rider_mailer/signup
  def signup
    RiderMailer.signup
  end

  # Preview this email at http://localhost:3000/rails/mailers/rider_mailer/updates
  def updates
    RiderMailer.updates
  end

end
