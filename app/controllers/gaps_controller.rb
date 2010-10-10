class GapsController < ApplicationController
  def new
    @logo = Gap.new
  end

  def create
    @logo = Gap.create! params[:gap]
    redirect_to gap_url(@logo)
  end

  def show
    @logo = Gap.find(params[:id])
  end

  def top
    @logos = Gap.top
  end

  def random
    c = Gap.count
    @logo = Gap.first(:offset =>rand(c))
    redirect_to logo_url(@logo)
  end  
end
