require './test/test_helper'

describe MetricsApi do
  include Goliath::TestHelper

  describe '/metrics.json' do
    describe 'GET' do
      it "should return all metrics with no URI params" do
      with_api(MetricsAPI) do
        puts 'test'
      end
      end
    end
  end
end
