class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to root_path, alert: 'Registrations are not open yet.'
  end

  def create
    redirect_to root_path, alert: 'Registrations are not open yet.'
  end
end
