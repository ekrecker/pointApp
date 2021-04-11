class Api::V1::PointsController < ApiController
  before_action :set_point, only: [:show]

  rescue_from Exception, with: :render_status_500

  def index
    points = Point.all
    render json: points
  end

  def show
    render json: @point
  end

  def create
    point = Point.new(point_params)
    if point.save
      render json: point, status: :created
    else
      render json: { errors: point.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    def set_point
      @point = Point.find(params[:id])
    end

    def point_params
      params.fetch(:point, {}).permit(:sender, :receiver, :mindtype, :comment, :reply, :likes)
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
