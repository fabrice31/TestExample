#!/usr/bin/env ruby
# Define global requirement, constants and environment
require 'rubygems'
require 'watir-webdriver'
require 'rspec-expectations'
require 'page-object'
require 'page-object/page_factory'

# PageObject Factory
World(PageObject::PageFactory)

# Global timeout when you wait for ajax
if ENV['BROWSER'] == 'ie'
  # internet explorer is slower : timeout increase
  SHORT_TIMEOUT = 5
  TIMEOUT = 15
else
  SHORT_TIMEOUT = 2
  TIMEOUT = 5
end


# Language by default is english
case ENV['LANG']
when 'EN'
  LANG = 'EN'
when 'FR'
  LANG= 'FR'
else
  LANG = 'EN'
end

# Deleting old screen before to make new tests
if not File.directory?('screen')
  Dir::mkdir('screen')
else
  base_dir = 'screen/'
  Dir.glob(File.join(base_dir,'*.png')).each do |old_screen|
    File.delete(old_screen)
  end
end

# Deleting old result reports
base_dir = './'
Dir.glob(File.join(base_dir,'result*.html')).each do |old_report|
  File.delete(old_report)
end
