class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
      authorize @wiki
  end

  def new
    @wiki = Wiki.new
      authorize @wiki
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    @wiki.user = current_user
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
    @collaborator = Collaborator.new
    @users = User.all
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
