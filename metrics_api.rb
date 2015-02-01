require 'csv'
require 'goliath'
require 'pry'

require './lib/metric'

class MetricsApi < Goliath::API

  def initialize
    @metrics = []
    CSV.foreach('metrics.csv', headers: true) do |row|
     @metrics <<  Metric.new(metric_id:           row['metric_id'],
                             start_date:          row['start_date'],
                             time_range_length:   row['time_range_length'],
                             value:               row['value'],
                             last_calculated_at:  row['last_calculated_at'],
                             end_date:            row['end_date'])
    end
  end

  def response(env)
    [200, {}, 'response']
  end

end
