require './test/test_helper'

  # test/sample_data/test.csv
  # "metric_id","start_date","time_range_length","value","last_calculated_at","end_date"
  # 4,949,1,4,1315325102,949
  # 4,1119,1,1,1329861902,1119
  # 4,949,7,4,1315325102,955
  # 4,1117,7,1,1329861902,1123
  # 4,942,30,4,1315325102,972
  # 4,1095,30,1,1329861902,1125
  # 15,901,1,2576,1308716102,901
  # 15,902,1,2738,1308803102,902
  # 15,903,1,2493,1308893701,903
  # 15,904,1,2081,1308981301,904
  # 15,905,1,1540,1309061102,905
  # 15,906,1,1843,1309148401,906
  # 15,907,1,2832,1309235402,907
  # 15,908,1,2842,1309322701,908
  # 15,909,1,2659,1309410001,909
  # 15,910,1,2394,1309493402,910
  # 15,911,1,1988,1309580702,911
  # 15,912,1,1571,1309668002,912
  # 15,913,1,1659,1309755302,913
  # 15,914,1,2003,1309839001,914


describe MetricsManager do

  # Contains 20 metrics:
  #  IDs 4, 15
  SAMPLE_METRICS_CSV = './test/sample_data/test.csv'

  before do
    @manager = MetricsManager.new(SAMPLE_METRICS_CSV)
  end

  describe "#get" do

    it "should return all metrics if no URI arguements are provided" do
      response = JSON.parse(@manager.get(nil))
      assert_equal 20, response.count
    end

    it "should only return metrics with specified ID" do
      response = JSON.parse(@manager.get("metric_id=4"))
      assert_equal 6, response.count
      response.each do |m|
        assert_equal 4, m['metric_id']
      end
    end

    it "should only return metrics create before before_date" do
      response = JSON.parse(@manager.get("before_date=2012-01-01"))
      assert response.count > 0, "Empty response!"
      response.each do |m|
        assert_operator Date.parse(m['start_date']), :<=, Date.parse('2012-01-01')
      end
    end

    it "should only return metrics created after after_date" do
      response = JSON.parse(@manager.get("after_date=2012-01-01"))
      assert response.count > 0, "Empty response!"
      response.each do |m|
        assert_operator Date.parse(m['end_date']), :>=, Date.parse('2012-01-01')
      end
    end

    it "should only return metrics with the specified value" do
      response = JSON.parse(@manager.get("value=2493"))
      assert_equal 1, response.count
      assert_equal "2493", response.first['value']
    end
  end

  describe "post" do
    it "should created at new metric with the correct values" do
      post_request = {  metric_id:          1,
                        start_date:         2,
                        time_range_length:  3,
                        value:              4,
                        last_calculated_at: 5,
                        end_date:           6 }.to_json

      response = @manager.post(post_request)

      assert_equal 201, response[0]
      assert_equal Hash.new, response[1]

      json = JSON.parse(response[2])
      assert_equal 1, json['metric_id']
      assert_equal 4, json['value']
      assert_equal 3, json['time_range_length']
      assert_equal "2009-01-03", json['start_date']
      assert_equal "2009-01-07", json['end_date']
    end
  end



end
