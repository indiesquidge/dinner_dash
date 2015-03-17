class AdminController < UsersController
  def show
    @orders = Order.all
    if current_user.admin?
      render :show
    else
      redirect_to menu_path, alert: "Unauthorized"
    end
  end
end
