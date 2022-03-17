class NomineesController < ApplicationController
  before_action :set_nominee, only: %i[ show edit update destroy ]

  # GET /nominees or /nominees.json
  def index
    redirect_to home_index_url
  end

  # GET /nominees/1 or /nominees/1.json
  def show
  end

  # GET /nominees/new
  def new
    @nominee = Nominee.new(nominee_id: params["format"])
  end

  # GET /nominees/1/edit
  def edit
  end

  # POST /nominees or /nominees.json
  def create
    @nominee = Nominee.new(nominee_params)

    respond_to do |format|
      if @nominee.save
        format.html { redirect_to nominee_url(@nominee), notice: "Nominee was successfully created." }
        format.json { render :show, status: :created, location: @nominee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nominees/1 or /nominees/1.json
  def update
    respond_to do |format|
      if @nominee.update(nominee_params)
        format.html { redirect_to nominee_url(@nominee), notice: "Nominee was successfully updated." }
        format.json { render :show, status: :ok, location: @nominee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominees/1 or /nominees/1.json
  def destroy
    @nominee.destroy

    respond_to do |format|
      format.html { redirect_to nominees_url, notice: "Nominee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nominee
      @nominee = Nominee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nominee_params
      params.fetch(:nominee, {})
      params.require(:nominee).permit(:id, :weightage, :nominee_id, :user_id)
    end
end
