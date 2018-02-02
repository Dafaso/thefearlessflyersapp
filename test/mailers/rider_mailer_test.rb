require 'test_helper'

class RiderMailerTest < ActionMailer::TestCase
  test "signup" do
    mail = RiderMailer.signup
    assert_equal "Signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "updates" do
    mail = RiderMailer.updates
    assert_equal "Updates", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
