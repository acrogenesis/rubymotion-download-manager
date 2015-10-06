# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/android'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Downloader'
  app.api_version = '19'
  app.main_activity = 'DownloadManagerActivity'
  app.permissions = [:internet, :write_external_storage]
end
