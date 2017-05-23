class RecordsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])

    if current_user != @record.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user

    if @record.save
      redirect_to records_path
    else
      render :new
    end
  end

  def update
    @record = Record.find(params[:id])

    if current_user != @record.user
      redirect_to root_path, alert: "You have no permission."
    end

    if @record.update(record_params)
      redirect_to records_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])

    if current_user != @record.user
      redirect_to root_path, alert: "You have no permission."
    end

    @record.destroy
    redirect_to records_path, alert: "Record deleted"
  end

  private

  def record_params
    params.require(:record).permit(:device_name, :description)
  end
end
