class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]

  def index
    @publications = Publication.all
    @users = User.all
  end

  def show
    @favorite = current_user.favorites.find_by(publication_id: @publication.id)
  end

  def new
    @publication = Publication.new
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id

    respond_to do |format|
      if @publication.save
        #PublicationMailer.published_mail(@publication).deliver
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @publication = Publication.new(publication_params)
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:image, :content)
  end
end
