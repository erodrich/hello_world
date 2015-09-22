class AdminController < ApplicationController
before_action :logged_in_user
before_action :admin_user, only: [:index, :services, :drivers]


def index
  @users = User.paginate(page: params[:page])
  @services = Service.where(status: 'Pendiente')
end

def services
  @services = Service.all
end

def drivers
  @drivers = User.where(driver: true)
end

private

end
