class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show

  end

  def edit

  end

  def create
    @song = Song.new(song_params)
    # binding.pry

    # if @song.valid?
    if @song.save
      # If--and only if--the post is valid, do what we usually do.
      # @song.save
      # This returns a status_code of 302, which instructs the browser to
      # worry about re-reading it from the database)
      redirect_to song_path(@song)
    else
      # If the post is invalid, hold on to @post, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :new
    end

  end

  def update
    if @song.update(song_params)

      # If--and only if--the post is valid, do what we usually do.
      # @post.save
      # This returns a status_code of 302, which instructs the browser to
      # worry about re-reading it from the database)
      redirect_to song_path(@song)
    else
      # If the post is invalid, hold on to @post, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      # dont know why i needed require for it to work right
   params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
 end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def article_params
    #   params.require(:article).permit(:title, :body)
    # end
end
