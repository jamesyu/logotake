class LogosController < ApplicationController
  VALID_TYPES = ['Gap', 'Myspace']
  
  def new
    @type = params[:type]
    redirect_to root_url if @type.blank? or not VALID_TYPES.include?(@type)
    
    @logo = Logo.new(:type => @type)
  end
  
  def create
    @logo = Logo.create! params[:logo]
    redirect_to logo_url(@logo)
  end
  
  def show
    @logo = Logo.find(params[:id])
  end
  
  def top
    @logos = Logo.top
  end
  
  def random
    c = Logo.count
    @logo = Logo.first(:offset =>rand(c))
    redirect_to logo_url(@logo)
  end  
end
