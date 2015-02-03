require 'bundler'
require 'simplecov'
SimpleCov.start

require "minitest/autorun"
require 'em-synchrony'
require 'pry'

require './lib/metric'
require './lib/metrics_manager'
