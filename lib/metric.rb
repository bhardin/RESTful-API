# Data transfer object
class Metric

  def initialize(metric_id:, start_date:, time_range_length:, value:, last_calculated_at:, end_date:)
    @metric_id          = metric_id
    @start_date         = start_date
    @time_range_length  = time_range_length
    @last_calculated_at = last_calculated_at
    @end_date           = end_date
  end

end
