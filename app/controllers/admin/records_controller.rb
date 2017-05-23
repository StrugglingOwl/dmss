class Admin::RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  def show
    @record = Record.find(params[:id])
  end

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to admin_records_path
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to admin_records_path
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])

    @record.destroy

    redirect_to admin_records_path
  end


  private

  def record_params
    params.require(:record).permit(:device_name, :description, :case_number, :date, :hospital, :hospital_contact, :telephone, :room_id, :device_model, :serial_number, :maintenance, :result, :remarks, :service_engineer)
  end

end
