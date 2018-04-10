class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy, :pictureLeft, :pictureRight]

  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.all
  end

  # GET /bands/1
  # GET /bands/1.json
  def show

  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  def upvote
     @band = Band.find(params[:id])
     @band.upvote_from current_user
      # redirect_back fallback_location: index
      # redirect_to bands_path
      band_id = (@band.id + 1).to_i
 # This line will break code if a band is ever destroyed.  Because
 #  The Show page is based off the Band ID,  will send to a page that doesn't exist
# (defined? Band.find(band_id))

      if Band.exists?(band_id)

        redirect_to band_path(band_id)
      else
        redirect_to bands_path
      end

   end

   def downvote
     @band = Band.find(params[:id])
     @band.downvote_from current_user
      # redirect_back fallback_location: index
      # redirect_to bands_url
      band_id = (@band.id + 1).to_i
    if Band.exists?(band_id)

      redirect_to band_path(band_id)
    else
      redirect_to bands_path
    end
   end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  # Once again the destroy method will break how the app runs because it will error out the
  # redirect_to band_path(band_id) method

  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:name, :description, :pictureLeft, :pictureRight)
    end
end
