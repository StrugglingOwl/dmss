class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.save

      redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:device_name, :description)
  end
end
