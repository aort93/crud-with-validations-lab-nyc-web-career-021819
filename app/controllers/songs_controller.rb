class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = single_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = single_song
  end

  def update
    @song = single_song

    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = single_song
    @song.destroy
    redirect_to @song
  end



  private

  def single_song
    Song.find_by(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
