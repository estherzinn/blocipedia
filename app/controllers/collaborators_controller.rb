class CollaboratorsController < ApplicationController

  def create

    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:email])

    # is there a class method for this check?
    if @user == nil
      flash[:error] = "Collaborator could not be found."
      redirect_to edit_wiki_path(@wiki)
    elsif @wiki.users.include?(@user)
      flash[:error] = "Collaborator already exists."
      redirect_to edit_wiki_path(@wiki)
    else
      collaborator = @wiki.collaborators.build(user_id: @user.id)

      if collaborator.save
        flash[:notice] = "Collaborator has been added."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:error] = "Collaborator could not be added."
        redirect_to edit_wiki_path(@wiki)
      end
    end

  end

  def destroy

    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "Collaborator could not be removed."
      redirect_to edit_wiki_path(@wiki)
  end

end


  

end