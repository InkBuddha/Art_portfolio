class Contact < MailForm::Base
	attribute :name,  validate: true, length: { maximum: 50 }
	attribute :email,	 validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, length: { maximum: 255 }
	attribute :message
	attribute :nickname, captcha: true

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.
	def headers
		{
			subject: "My Contact Form",
			to: ENV["GMAIL_USERNAME"],
			from: %("#{name}" <#{email}>)
		}
	end
end
