class MetricsManager
  require 'cgi'
  require 'csv'
  require 'json'

  def initialize(csv)
    # We could start an EM.periodic_timer to check if the metrics CSV has been updated. -DanK
    # We are assuming the dataset is valid. - DanK
    @metrics = []
    CSV.foreach(csv, headers: true) do |row|
     @metrics <<  Metric.new(metric_id:           row['metric_id'],
                             start_date:          row['start_date'],
                             time_range_length:   row['time_range_length'],
                             value:               row['value'],
                             last_calculated_at:  row['last_calculated_at'],
                             end_date:            row['end_date'])

    end
  end

  def get(query_string)
    result = @metrics.dup

    if !!query_string
      hashed_query = CGI::parse(query_string)

      if hashed_query.keys.include?("metric_id")
        result.delete_if { |m| m.metric_id != hashed_query["metric_id"].first.to_i }
      end

      if hashed_query.keys.include?("before_date")
        result.delete_if { |m| m.start_date > Date.parse(hashed_query["before_date"].first) }
      end

      if hashed_query.keys.include?("after_date")
        result.delete_if { |m| m.end_date < Date.parse(hashed_query["after_date"].first) }
      end

      if hashed_query.keys.include?("value")
        result.delete_if { |m| m.value != hashed_query["value"].first }
      end
    end

    result.map { |r| r.to_hash }.to_json
  end

  def post(json)
    m = Metric.from_json(json)
    @metrics << m
    [201, {}, m.to_json]
  rescue
    [500, {}, "Some error messsage"]
  end
end
