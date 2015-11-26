class UserMailer < ActionMailer::Base
    default from: "ECOFY <eco@ecofy.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "I Ecofy, do you? Excited for @EcofyNow to launch."

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
