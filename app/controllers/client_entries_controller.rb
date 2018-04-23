class ClientEntriesController < ApplicationController
  before_action :set_client_entry, only: [:show, :update, :destroy]

  # GET /client_entries
  def index
    @client_entries = ClientEntry.all

    render json: @client_entries
  end

  # GET /client_entries/1
  def show
    render json: @client_entry
  end

  # POST /client_entries
  def create
    @client_entry = ClientEntry.new(client_entry_params)

    if @client_entry.save
      render json: @client_entry, status: :created, location: @client_entry
    else
      render json: @client_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_entries/1
  def update
    if @client_entry.update(client_entry_params)
      render json: @client_entry
    else
      render json: @client_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_entries/1
  def destroy
    @client_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_entry
      @client_entry = ClientEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_entry_params
      params.require(:client_entry).permit(:client_id, :entry_id)
    end
end
