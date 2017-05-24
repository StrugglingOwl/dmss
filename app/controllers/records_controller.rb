class RecordsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_record_and_check_permission, only: [:edit, :update, :destroy]

  def index

    @records = case params[:order]
      when 'by_room_id'
        Record.order('room_id DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_device_model'
        Record.order('device_model DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_serial_number'
        Record.order('serial_number DESC').paginate(:page => params[:page], :per_page => 10)
      else
        Record.recent.paginate(:page => params[:page], :per_page => 10)
      end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
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
    if @record.update(record_params)
      redirect_to records_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path, alert: "Record deleted"
  end

  private

  def find_record_and_check_permission
    @record = Record.find(params[:id])

    if current_user != @record.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def record_params
    params.require(:record).permit(:device_name, :description, :case_number, :date, :hospital, :hospital_contact, :telephone, :room_id, :device_model, :serial_number, :maintenance, :result, :remarks, :service_engineer)
  end
end
