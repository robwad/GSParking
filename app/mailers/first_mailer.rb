class FirstMailer < ApplicationMailer

	def sample_email(person)
		@person = person
		mail(to: @person.email, subject: 'Sample Email')
	end
end
