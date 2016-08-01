class BarsController < ApplicationController
  def index
    @q = Bar.ransack(params[:q])
    @bars = @q.result
  end
end
