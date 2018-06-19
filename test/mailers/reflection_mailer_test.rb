require 'test_helper'

class ReflectionMailerTest < ActionMailer::TestCase
  test "weekly_reflection" do
    mail = ReflectionMailer.weekly_reflection
    assert_equal "Weekly reflection", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
