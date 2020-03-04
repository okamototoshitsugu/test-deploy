class SearchController < ApplicationController
	before_action :authenticate_user!

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@method = params["search"]["method"]
		@records = search_for(@model, @content, @method)
		@books = Book.all
	end

	private
	def search_for(model, content, method)
		if model == 'user'
			if method == 'perfect'
				User.where(name: content)
			elsif method == 'forward'
				User.where('name LIKE ?', content+'%')
			elsif method == 'backward'
				User.where('name LIKE ?', '%'+content)
			else
				User.where('name LIKE ?', '%'+content+'%')
			end
		elsif model == 'book'
			if method == 'perfect'
				Book.where(title: content)
			elsif method == 'forward'
				Book.where('title LIKE ?', content+'%')
			elsif method == 'backward'
				Book.where('title LIKE ?', '%'+content)
			else
				Book.where('title LIKE ?', '%'+content+'%')
			end
		end
	end
end
