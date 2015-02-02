require 'goliath'
require 'em-synchrony'
require 'pry'

require './lib/metrics_manager'
require './lib/metric'

class MetricsApi < Goliath::API

  CSV = 'metrics.csv'

  def initialize
    @metrics_manager = MetricsManager.new(CSV)
  end

  def response(env)
    case env['PATH_INFO']
    when "/metrics.json"
      case env['REQUEST_METHOD']
      when 'GET'
        [200, {}, @metrics_manager.get(env['QUERY_STRING'])]
      when 'POST'
        @metrics_manager.post(env['rack.input'].string)
      end
    else
      [404, {}, nil]
    end
  end

end
