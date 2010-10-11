class MyspacesController < ApplicationController
  def new
    @logo = Myspace.new
  end

  def create
    @logo = Myspace.create! params[:myspace]
    redirect_to myspace_url(@logo)
  end

  def show
    @logo = Myspace.find(params[:id])
  end

  def top
    @logos = Myspace.top
  end

  def random
    c = Myspace.count
    @logo = Myspace.first(:offset =>rand(c))
    redirect_to myspace_url(@logo)
  end    
end
