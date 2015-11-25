class UserMailer < ActionMailer::Base.smtp_settings = { 
:address => "smtp.gmail.com",
:port => 587,
:domain => "ecofy.com",
:user_name => "eco",
:password => "ralkwl1mlq", 
:authentication => "plain",
:enable_starttls_auto => true }
    default from: "ECOFY <eco@ecofy.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "I Ecofy, do you? Excited for @ecofy to launch."

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
