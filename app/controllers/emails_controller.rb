class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email_letter = EmailMailer.send_email(@email)
    render :show
  end
  
  def sendit
    @email = Email.find(params[:id])
    EmailMailer.send_email(@email).deliver
    # render :nothing => true
    redirect_to :back
  end

  def new
    @email = Email.new
    10.times do
      @email.headerables.build
    end
  end

  def create
    @email = Email.new(params[:email])
    if @email.save
      redirect_to @email, :notice => "Successfully created email."
    else
      render :action => 'new'
    end
  end

  def edit
    @email = Email.find(params[:id])
    3.times do
      @email.headerables.build
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.update_attributes(params[:email])
      redirect_to @email, :notice  => "Successfully updated email."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_url, :notice => "Successfully destroyed email."
  end
end
