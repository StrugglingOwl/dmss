class RecordsController < ApplicationController
  before_action :authenticate_user! , only: [:new]

  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to records_path
    else
      render :new
    end
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    flash[:alert] = "Record deleted"
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:device_name, :description)
  end
end
