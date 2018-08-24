class BaytalliesController < ApplicationController
	def index
		@baytallies = Baytally.all
	end
end
