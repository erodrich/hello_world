class ServicesController < ApplicationController
before_action :logged_in_user, only: [:create]


def create
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:success] = "Su solicitud ha sido enviada!"
      redirect_to user_path(current_user.id)
    else
      render 'main/index'
    end
end


private

  def service_params
    params.require(:service).permit(:addr_from, :addr_to, :date, :time, :num_passengers, :payment_method, :type_vehicle)
  end
end
