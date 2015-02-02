# Simple RESTful API

## Usage

To run locally, `bundle install` and then `bundle exec ruby metrics_api.rb -sv`.  The API will be available at `localhost:9000`.

To run the tests, run `bundle exec rake test`.

### GET

Get takes several arguments in the form for URI params:

- metric_id
- before\_date (yyyy-mm-dd _eg 2015-01-01_)
- after\_date (yyyy-mm-dd _eg 2015-01-01_)
- value

__Examples:__

- How many users signed up after viewing a blog post on Aug 8, 2011?
	- "Number of people who signed up after viewing blog post" is metric 4.

    `/metrics.json?metric_id=4&after_date=2015-01-01`


- During the month of March 2012, how many people purchased something after signing up?
	- "Number of people purchased something after signing up" is metric 100.

	`/metrics.json?metric_id=100&after_date=2012-02-28&before_date=2012-04-01`


### POST

Post takes JSON:

```
{
  "metric_id" : "1",
  "start_date" : "1",
  "time_range_length" : "1", 
  "value" : "1",
  "last_calculated_at" : "1",
  "end_date" : "1"
}
```

and upon successful creation of a Metric will return the metric:

```
{
    "metric_id": 1,
    "start_date": "2009-01-02",
    "time_range_length": 1,
    "value": "1",
    "last_calculated_at": "1969-12-31T16:00:01-08:00",
    "end_date": "2009-01-02"
}
```