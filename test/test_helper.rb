require 'simplecov'
SimpleCov.start

require 'bundler'
require "minitest/autorun"
require 'em-synchrony'
require 'pry'

require './lib/metric'
require './lib/metrics_manager'
