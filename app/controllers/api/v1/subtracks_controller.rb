class Api::V1::SubtracksController < Api::V1::BaseController
  before_action :set_subtrack, only: %i[show update destroy]

  def index
    subtracks = @current_user.subtracks.order(date: :desc)
    render json: subtracks
  end

  def show
    render json: @subtrack
  end

  def create
    subtrack = @current_user.subtracks.build(subtrack_params)
    if subtrack.save
      render json: subtrack, status: :created
    else
      render json: { errors: subtrack.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @subtrack.update(subtrack_params)
      render json: @subtrack
    else
      render json: { errors: @subtrack.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subtrack.destroy
    head :no_content
  end

  private

  def set_subtrack
    @subtrack = @current_user.subtracks.find(params[:id])
  end

  def subtrack_params
    params.require(:subtrack).permit(:amount, :memo, :date)
  end
end
