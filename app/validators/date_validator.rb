class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if allowed? value

    unless date? value
      record.errors[attribute] << (options[:message] || "is not a date")
    end
  end

  protected

  def allowed?(value)
    (value.nil? && options[:allow_nil]) ||
      (value.blank? && options[:allow_blank])
  end

  def date?(value)
    return true if temporal_object?(value)

    begin
      Date.parse value
      true
    rescue ArgumentError
      false
    end
  end

  def temporal_object?(value)
    time_object?(value) ||
      date_object?(value) ||
      time_with_zone_object?(value)
  end

  def time_object?(value)
    defined?(Time) && value.is_a?(Time)
  end

  def date_object?(value)
    defined?(Date) && value.is_a?(Date)
  end

  def time_with_zone_object?(value)
    defined?(ActiveSupport::TimeWithZone) &&
      value.is_a?(ActiveSupport::TimeWithZone)
  end
end
