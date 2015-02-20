class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to(current_user).paginate(page: params[:page], per_page: 10)
      authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
      authorize @wikis
  end

  def new
    @wiki = Wiki.new
      authorize @wiki
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
      authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end  

  def edit
    @wiki = Wiki.find(params[:id])
      authorize @wiki
  end

  def update
     @wiki = Wiki.find(params[:id])
      authorize @wiki
     if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
       flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :edit
     end
   end

end
