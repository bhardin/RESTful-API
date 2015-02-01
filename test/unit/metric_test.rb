require './test/test_helper'

describe Metric  do

  describe "valid Metric" do
    before do
      @metric = Metric.new(metric_id: 1,
                           start_date: 1,
                           time_range_length: 1,
                           value: 1,
                           last_calculated_at: 1,
                           end_date: 1)
    end

    describe '#start_date' do
      it "should be returned as a Date" do
        assert_kind_of Date, @metric.start_date
      end
    end

    describe '#end_date' do
      it "should be returned as a Date" do
        assert_kind_of Date, @metric.end_date
      end
    end

    describe '#last_calculated_at' do
      it "should be returned as a DateTime" do
        assert_kind_of DateTime, @metric.last_calculated_at
      end
    end
  end
end
