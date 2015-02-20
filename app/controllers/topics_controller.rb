  def index
     @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
  end