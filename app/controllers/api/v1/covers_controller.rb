class Api::V1::CoversController < ApiController
  before_action :set_cover, only: [:show, :update, :destroy]

  # GET /covers
  def index
    @covers = Cover.all

    render json: @covers
  end

  # GET /covers/1
  def show
    render json: @cover
  end

  # POST /covers
  def create
    @cover = Cover.new(cover_params_attributes)

    if @cover.save
      render json: @cover, status: :created
    else
      render json: @cover.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /covers/1
  def update
    if @cover.update(cover_params_attributes)
      render json: @cover
    else
      render json: @cover.errors, status: :unprocessable_entity
    end
  end

  # DELETE /covers/1
  def destroy
    @cover.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cover_params
      params.require(:data).permit(:type, attributes:[ :cover ] )
    end

    def cover_params_attributes
      cover_params[:attributes] || {}
    end
end
