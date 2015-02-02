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
