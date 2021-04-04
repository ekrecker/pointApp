class Api::V1::PointsController < ApiController
  before_action :set_points, only: [:show]

  def index
    points = Point.all
    render json: points
  end

  def show
    @point = Point.find(params[:id])
    render json: @point
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
