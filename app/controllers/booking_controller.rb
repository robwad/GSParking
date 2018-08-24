class BookingController < ApplicationController
	require 'net/smtp'

	def choosebay
		@bay1 = User.where(date: Date.today, bay: 1).count
		@bay2 = User.where(date: Date.today, bay: 2).count
		@bay3 = User.where(date: Date.today, bay: 3).count
	end

	def button1
		if User.where(date: Date.today, bay: 1).count == 0
			session[:baychosen] = 0
		else
			session[:baychosen] = 1
		end
		redirect_to '/enterdetails'
	end

	def button2
		if User.where(date: Date.today, bay: 2).count == 0
			session[:baychosen] = 0
		else
			session[:baychosen] = 2
		end
		redirect_to '/enterdetails'
	end

	def button3
		if User.where(date: Date.today, bay: 3).count == 0
			session[:baychosen] = 0
		else
			session[:baychosen] = 3
		end
		redirect_to '/enterdetails'
	end

	def enterdetails
	end

	def checkdetails
		#  could add a hash function in the line below and then have 
		#  another hash column in Person model that is a hash of password column
		@temp = Person.find_by(email: params[:email], password: params[:password])
		if @temp == nil then
			@error = "Your email or password is incorrect."
			render 'enterdetails'
		elsif session[:baychosen] == 0 then
			@error = "This bay is full."
			render 'enterdetails'
		else
		    #  shoot email to @temp.email with @baycode and @parkingcode
		    @parkingcode = rand(32**8).to_s(32)
		    @baycode = session[:baychosen]
		    redirect_to '/bookingconfirmation'
		end
	end



	def bookingconfirmation
	end
end



