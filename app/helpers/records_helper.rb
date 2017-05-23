module RecordsHelper
  def render_record_description(record)
    simple_format(record.description)
  end
end
