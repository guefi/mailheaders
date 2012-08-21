class HeadersController < ApplicationController
  def index
    @headers = Header.all
  end

  def show
    @header = Header.find(params[:id])
  end

  def new
    @header = Header.new
  end

  def create
    @header = Header.new(params[:header])
    if @header.save
      redirect_to @header, :notice => "Successfully created header."
    else
      render :action => 'new'
    end
  end

  def edit
    @header = Header.find(params[:id])
  end

  def update
    @header = Header.find(params[:id])
    if @header.update_attributes(params[:header])
      redirect_to @header, :notice  => "Successfully updated header."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @header = Header.find(params[:id])
    @header.destroy
    redirect_to headers_url, :notice => "Successfully destroyed header."
  end
end
