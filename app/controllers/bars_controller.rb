class BarsController < ApplicationController
  def index
    @q = Bar.ransack(params[:q])
    @bars = @q.result

    respond_to do |format|
      format.html {}
      format.json { render json: @bars }
    end
  end

  def show
    bar = Bar.find(params[:id])
    respond_to do |format|
      format.json { render json: bar }
    end
  end
end
