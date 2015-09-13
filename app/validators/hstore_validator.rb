class HstoreValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || value.empty? || value.values.any? { |e| e.empty? }
      record.errors[attribute] << (options[:message] || "can't be blank")
    end
  end
end
