class SongsController < ApplicationController

before_action :set_artist

  def new
    @song = @artist.songs.build
  end

  def create
    @song = @artist.songs.create(song_params)

    if @song.save
      redirect_to @artist
    else
      render "new"
    end
  end

  private

    def song_params
      params.require(:song).permit(:name, :link, :artist_id)
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

end
