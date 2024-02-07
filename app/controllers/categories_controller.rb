class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show ]

  # GET /categories or /categories.json
  def index
    user_id = current_user.id
    @categories = Category.includes(:entities).where(user_id: user_id)
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    user = current_user
    @category.user = user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.includes(:entities).find(params[:id])
      @totals = helpers.get_transaction_total(@category.entities)
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon)
    end
end
