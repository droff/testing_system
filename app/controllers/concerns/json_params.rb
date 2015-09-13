module JsonParams

  def incorrect_params?
    json_nil? || value_nil?
  end

  private

  def json_nil?
    params[:json].nil?
  end

  def value_nil?
    params[:json].map { |e| e.select { |k, v| v[:value].nil? }.to_a }
      .flatten.present?
  end
end
