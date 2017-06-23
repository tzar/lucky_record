module LuckyRecord::Validations
  private def validate_required(*fields)
    fields.each do |field|
      if field.value.blank?
        field.add_error "is required"
      end
    end
  end

  private def validate_acceptance_of(field : LuckyRecord::Field(Bool))
    if field.value == false
      field.add_error "must be accepted"
    end
  end
end