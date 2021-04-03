class PointsController < ApplicationController
  def index
    @points = Point.all
  end

  def show
    @point = Point.find_by(:sender => params[:sender])
  end

  def new
  end

  def create
    @point = Point.new
    @point.sender = params[:point][:sender]
    @point.receiver = params[:point][:receiver]
    @point.mindType = params[:point][:mindType]
    @point.sender_comment = params[:point][:sender_comment]
    @point.save
    redirect_to '/points/index'
  end
end
