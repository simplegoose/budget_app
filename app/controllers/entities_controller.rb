class EntitiesController < ApplicationController
  before_action :set_category, only: %i[ new create ]

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)
    user = current_user
    @entity.category = @category
    @entity.author = user

    respond_to do |format|
      if @entity.save
        format.html { redirect_to category_url(@category), notice: "Entity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end
