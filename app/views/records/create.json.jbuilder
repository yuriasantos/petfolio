if @record.persisted?
  json.record render(partial: "records/record", formats: :html, locals: {record: @record})
else
  json.form render(partial: "records/form", formats: :html, locals: {appointment: @record.appointment, record: @record})
end
