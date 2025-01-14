module Dashboard
  class PhotosController < ApplicationController
    before_action :set_album

    def create
      @photo = @album.photos.new(photo_params)

      if @photo.save
        redirect_to dashboard_album_path(@album), notice: "Photo uploaded successfully."
      else
        redirect_to dashboard_album_path(@album), alert: "Failed to upload photo."
      end
    end

    def destroy
      @photo = @album.photos.find(params[:id])
      @photo.destroy
      redirect_to dashboard_album_path(@album), notice: "Photo deleted successfully."
    end

    private

    def set_album
      @album = Album.find(params[:album_id])
    end

    def photo_params
      params.require(:photo).permit(:image, :caption)
    end
  end
end
