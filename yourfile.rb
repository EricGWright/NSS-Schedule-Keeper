#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

program :version, '0.0.1'
program :description, 'testing commander'
 
command :new do |c|
  c.syntax = 'cmnd new [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Cmnd::Commands::New
  end
end

command :list do |c|
  c.syntax = 'cmnd list [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Cmnd::Commands::List
  end
end

command :show do |c|
  c.syntax = 'cmnd show [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Cmnd::Commands::Show
  end
end

command :delete do |c|
  c.syntax = 'cmnd delete [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    # Do something or c.when_called Cmnd::Commands::Delete
  end
end

