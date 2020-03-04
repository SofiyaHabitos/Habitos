require 'test_helper'

class HistoryNotifierMailerTest < ActionMailer::TestCase
  test "history" do
    mail = HistoryNotifierMailer.history
    assert_equal "History", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
