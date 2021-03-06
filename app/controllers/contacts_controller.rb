class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      @contact.deliver
    end    
    if @contact.deliver
      redirect_to(root_path, :notice => "Thank you for contacting me. I will reply shortly!")
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
