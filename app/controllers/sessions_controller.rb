class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(correo: params[:session][:correo].downcase)
    if user && user.authenticate(params[:session][:password]) && user.active?
      # Log the user in and redirect to the user's show page.
      log_in user
      if user.admin
          redirect_to '/admin'
        else
          redirect_to user
        end
    else
      flash.now[:danger] = 'Correo o contraseña no validos'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end

end
