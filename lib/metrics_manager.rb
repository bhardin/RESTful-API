class MetricsManager
  require 'cgi'
  require 'csv'
  require 'json'

  def initialize(csv)
    # We could start an EM.periodic_timer to check if the metrics CSV has been updated. -DanK
    # We are assuming the dataset is valid.i - DanK
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
    @results = @metrics

    if !query_string.empty?

      hashed_query = CGI::parse(query_string)


    end

    @results.map { |r| r.to_hash }.to_json

  end
end
