class EmailsController < ApplicationController
  def index
    @emails = Email.order("updated_at desc")
  end

  def show
    @email = Email.find(params[:id])
    @email_mailer = EmailMailer
    @email_letter = @email_mailer.send_email(@email)
    # @email_headers = @email_mailer.get_headers
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

    # init with rails 3.2 default headers
    ["mime_version", "charset", "content_type", "from", "to"].each_with_index do |header, index|
      this_header = @email.headerables[index]
      global_header = Header.find_by_name(header)
      this_header.header_id = global_header.id
      this_header.value = global_header.default_value
    end

    @email_headers = EmailMailer.get_headers
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
    5.times do
      @email.headerables.build
    end
    @email_headers = EmailMailer.get_headers
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
