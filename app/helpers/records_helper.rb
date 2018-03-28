module RecordsHelper
  def render_record_device_name(record)
    simple_format(record.device_name)
  end

  def render_record_description(record)
    simple_format(record.description)
  end

  def render_record_room_id(record)
    simple_format(record.room_id)
  end

  def render_record_device_model(record)
    simple_format(record.device_model)
  end

  def render_record_serial_number(record)
    simple_format(record.serial_number)
  end

  def render_record_result(record)
    simple_format(record.result)
  end

  def render_highlight_content(record,query_string)
    excerpt_cont = excerpt(record.description,query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

end
