class GiftingController < ApplicationController
	

	# resets session values to false
	def landing
		session[:increase] = false
		session[:redeemed] = false
	end

	def login
	end

	# deals with verification/ consequences of /login form and stores the user to prevent multiple same-day logins
	def log_user_in
		session[:increase] = false
		session[:redeemed] = false
		# TO DO: add a hash function in the line below and then have 
		# another hash column in Person model that is a hash of the password column
		@temp = Person.find_by(email: params[:email], password: params[:password])
		if @temp == nil or !@temp.has_space then
			@error = "Your email or password is incorrect."
			render 'login'
		else
			@user = User.new
			@user.email = @temp.email
			@user.password = @temp.password
			@user.bay = @temp.bay
			@user.date = Date.today
        	if User.find_by(email: @user.email, date: @user.date) == nil then
		 	  @user.save
		 	  @temp.points += 20
		      @temp.save
		      session[:increase] = true
		    end

		    session[:email] = @temp.email
			redirect_to '/profile'
		end
	end

	# handles /profile 
	def profile
		@temp = Person.find_by(email: session[:email])
		@current = @temp
	end

	# handle user redeeming smoothie voucher
	def item1
		@person = Person.find_by(email: session[:email])
		@person.points -= 50
		@person.save
		@vouchercode = rand(32**8).to_s(32)
		session[:redeemed] = true
		# TO DO: send email to @person.email with voucher number and item name (smoothie)
		# @parkingcode = rand(32**8).to_s(32)
		# @baycode = session[:baychosen]
		# @temp.parking_code = @parkingcode
		# @temp.baycode = @baycode
		# FirstMailer.sample_email(@person).deliver
		redirect_to '/profile'
	end

	# handle user redeeming takealot voucher
	def item2
		@person = Person.find_by(email: session[:email])
		@person.points -= 250
		@person.save
		@vouchercode = rand(32**8).to_s(32)
		session[:redeemed] = true
		# TO DO: send email to @person.email with voucher number and item name (takealot)
		# shoot email to @temp.email with @baycode and @parkingcode
		# @parkingcode = rand(32**8).to_s(32)
		# @baycode = session[:baychosen]
		# @temp.parking_code = @parkingcode
		# @temp.baycode = @baycode
		# FirstMailer.sample_email(@person).deliver
		redirect_to '/profile'
	end
end
