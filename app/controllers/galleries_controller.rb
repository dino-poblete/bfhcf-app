class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:list, :new, :show, :edit, :update, :destroy]
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  def list
    @galleries = Gallery.paginate(page: params[:page])
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @images = @gallery.images.all
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
    @image = @gallery.images.build
  end

  # GET /galleries/1/edit
  def edit
    #@gallery = Gallery.find(params[:id])
    #not_found and return if !@gallery
    #@gallery.images.build
    #render :new
    @images = @gallery.images.all
    @gallery.images.build
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save

       if params.has_key?(:images)
            params[:images][:file].each do |a|
              @image = @gallery.images.create!(:file => a, :gallery_id => @gallery.id)
            end
       end
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update

    respond_to do |format|

      if params.has_key?(:images)
        params[:images][:file].each do |a|
          @image = @gallery.images.create!(:file => a, :gallery_id => @gallery.id)
        end
      end

      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to list_galleries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :content, images_attributes: [:id, :gallery_id, :file])
    end
end
