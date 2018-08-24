class GiftingController < ApplicationController
	def landing
		session[:increase] = false
		session[:redeemed] = false
	end

	def login
	end

	def log_user_in
	    #could add a hash function in the line below and then have 
		# another hash column in Person model that is a hash of password column
		session[:increase] = false
		session[:redeemed] = false
		@temp = Person.find_by(email: user_params[:email], password: user_params[:password])

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

	def profile
		@temp = Person.find_by(email: session[:email])
		@current = @temp
	end

	def item1
		@person = Person.find_by(email: session[:email])
		@person.points -= 50
		@person.save
		@vouchercode = rand(32**8).to_s(32)
		session[:redeemed] = true
		# send email to @person.email with voucher number and item name
		redirect_to '/profile'
	end

	def item2
		@person = Person.find_by(email: session[:email])
		@person.points -= 250
		@person.save
		@vouchercode = rand(32**8).to_s(32)
		session[:redeemed] = true
		# send email to @person.email with voucher number and item name
		redirect_to '/profile'
	end

	# def redeem
	# 	@pop = true
	# 	redirect_to '/profile'
	# end


    private

	  def user_params
		  params
	  end

	# def send_email
		
	# end
end
