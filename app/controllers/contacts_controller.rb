class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = "Message envoyé."
		else
			flash.now[:error] = "Il y a eu un problème et votre message n'a pas été envoyé."
			render :new
		end
	end
end
