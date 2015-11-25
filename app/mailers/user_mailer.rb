class UserMailer < ActionMailer::Base
    default from: "ECOFY <info@ecofy.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "I Ecofy, do you? Excited for @ecofy to launch."

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
