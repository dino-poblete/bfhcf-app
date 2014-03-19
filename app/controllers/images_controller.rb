class ImagesController < ApplicationController
  def destroy_multiple

    Image.destroy(params[:images])

    flash[:notice] = 'Image was successfully deleted.'
    respond_to do |format|
      format.html { redirect_to edit_gallery_path(params[:gallery_id]) }
      format.json { head :no_content }
    end

  end
end