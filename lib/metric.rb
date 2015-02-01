# Data Transfer Object
class Metric
  require 'date'

  def initialize(metric_id:, start_date:, time_range_length:, value:, last_calculated_at:, end_date:)
    @metric_id          = metric_id.to_i
    @start_date         = start_date.to_i
    @time_range_length  = time_range_length.to_i
    @last_calculated_at = last_calculated_at.to_i
    @end_date           = end_date.to_i
  end

  def start_date
    Date.new(2009, 1, 1) + @start_date
  end

  def end_date
    Date.new(2009, 1, 1) + @end_date
  end

  def last_calculated
    Time.at(@last_calculated_at).to_datetime
  end

  def to_hash
    {metric_id: @metric_id,
     start_time: @start_date,
     time_length_range: @time_length_range,
     last_calculated_at: @last_calculated_at,
     end_date: @end_date}
  end

end
