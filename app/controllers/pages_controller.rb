class PagesController < ApplicationController

	def show
		@page = Page.find(params[:id])
	end

	def index
	end

	def mercury_update
	  page = Page.find(params[:id])
	  # Update page
	  render text: ""
	end

	def update
	  page = Page.find(params[:id])
	  page.name =params[:content][:name][:value]
	  page.content = params[:content][:content][:value]
	  # page.update(pages_params)
	  page.save!
	  render text: ""
	end
	private
		def pages_params

			params.require(:content).permit!
		end
end
