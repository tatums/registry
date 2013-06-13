class UserMailer < ActionMailer::Base
  default from: "robot@tatumandleslie.com"

  def personal_message(user, contribution)
    @user = user
    @contribution = contribution
    mail( to:       %w(tatum@ashlandstudios.com lbfitzpatrick@googlemail.com),
          subject:  "Personal Message")
  end

end
