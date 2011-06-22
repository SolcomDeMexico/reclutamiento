# encoding: UTF-8
class PaginasController < ApplicationController

	def home
		if signed_in?
			redirect_to home_path
		end
	end
end
