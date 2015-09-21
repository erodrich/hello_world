class AdminController < ApplicationController
before_action :logged_in_user
before_action :admin_user, only: [:index, :services, :drivers]


def index
  @users = User.paginate(page: params[:page])
  @pending_services = Service.where(status: 'En proceso')
end

def services
  @pending_services = Service.all
end

def drivers
  @drivers = User.where(driver: true)
end

private

end