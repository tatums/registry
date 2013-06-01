class UserMailer < ActionMailer::Base
  default from: "robot@tatumandleslie.com"

  def personal_message(user, contribution)
    @user = user
    @contribution = contribution
    mail(:to => 'tatum@ashlandstudios.com', :subject => "Welcome to My Awesome Site")
  end

end
