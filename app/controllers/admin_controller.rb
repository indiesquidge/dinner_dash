class AdminController < UsersController
  def show
    if current_user.admin?
      render :show
    else
      redirect_to menu_path, alert: "Unauthorized"
    end
  end
end
