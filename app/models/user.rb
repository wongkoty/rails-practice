class User < ActiveRecord::Base
	# attr_accessible :name, :email

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	before_save { |user| user.email = email.downcase }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	has_secure_password


	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
