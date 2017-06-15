class CalculateController < ApplicationController

  def index
    if strong_params[:input]
      @input = strong_params[:input]
      @result = Calculate.new(strong_params[:input]).result
    else
      @result = nil
      @input = nil
    end
  end


  private

  def strong_params
    params.permit(:input)
  end




end
