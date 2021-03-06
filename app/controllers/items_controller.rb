class ItemsController < OpenReadController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    # @items = current_user.items.find(params[:id])
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = current_user.items.build(item_params)
    # @item = Item.new(item_params)

    if current_user.isadmin == true
      @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
      # render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    render json: @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = current_user.items.find(params[:id])
      # Display only the current user's items during show, update, delete
      # Commented out for quick reference during development
      # @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :category)
    end
end
