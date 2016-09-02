class User < ActiveRecord::Base
	# attr_accessible :name, :email

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	before_save { |user| user.email = email.downcase }
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	has_secure_password

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
