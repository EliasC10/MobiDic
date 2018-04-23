class EntryCategoriesController < ApplicationController
  before_action :set_entry_category, only: [:show, :update, :destroy]

  # GET /entry_categories
  def index
    @entry_categories = EntryCategory.all

    render json: @entry_categories
  end

  # GET /entry_categories/1
  def show
    render json: @entry_category
  end

  # POST /entry_categories
  def create
    @entry_category = EntryCategory.new(entry_category_params)

    if @entry_category.save
      render json: @entry_category, status: :created, location: @entry_category
    else
      render json: @entry_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entry_categories/1
  def update
    if @entry_category.update(entry_category_params)
      render json: @entry_category
    else
      render json: @entry_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entry_categories/1
  def destroy
    @entry_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_category
      @entry_category = EntryCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_category_params
      params.require(:entry_category).permit(:entry_id, :category_id)
    end
end
