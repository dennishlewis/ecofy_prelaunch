class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 0,
            "html" => "Resource<br>Guide",
            "class" => "two",
            "image" =>  "refer/cream-tooltip@2x.png"
        },
        {
            'count' => 5,
            "html" => "2016 ECOFY<br>calendar",
            "class" => "three",
            "image" => "refer/truman@2x.png"
        },
        {
            'count' => 10,
            "html" => "Win a $2,000<br>Gift Card",
            "class" => "four",
            "image" => "refer/winston@2x.png"
        },
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
