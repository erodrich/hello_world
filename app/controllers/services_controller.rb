class ServicesController < ApplicationController
before_action :logged_in_user, only: [:create, :edit, :update]


def create
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:success] = "Su solicitud ha sido enviada!"
      redirect_to user_path(current_user.id)
    else
      render 'main/index'
    end
end

def show
  @service = Service.find(params[:id])
  @user = User.find(@service.user_id)
end

def edit
  @service = Service.find(params[:id])
end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update(service_params)
        flash[:success] = "Cambios guardados correctamente"
        format.html { redirect_to @service }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end
private

  def service_params
    params.require(:service).permit(:addr_from, :addr_to, :date, :time, :num_passengers, :payment_method, :type_vehicle, :status)
  end
end
