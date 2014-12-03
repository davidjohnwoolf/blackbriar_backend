module CustomersHelper
  def list_users
    @users = User.all
  end
end
