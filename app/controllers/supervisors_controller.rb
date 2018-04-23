class SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :update, :destroy]

  # GET /supervisors
  def index
    @supervisors = Supervisor.all

    render json: @supervisors
  end

  # GET /supervisors/1
  def show
    render json: @supervisor
  end

  # POST /supervisors
  def create
    @supervisor = Supervisor.new(supervisor_params)

    if @supervisor.save
      render json: @supervisor, status: :created, location: @supervisor
    else
      render json: @supervisor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supervisors/1
  def update
    if @supervisor.update(supervisor_params)
      render json: @supervisor
    else
      render json: @supervisor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supervisors/1
  def destroy
    @supervisor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supervisor
      @supervisor = Supervisor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supervisor_params
      params.require(:supervisor).permit(:name, :password, :institution_id)
    end
end
