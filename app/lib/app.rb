# frozen_string_literal: true

require 'sinatra'

get '/download' do
  File.open("#{ENV['DOWNLOAD_PATH']}/downloaded.txt", 'w') do |f|
    f.write("Downloaded at: #{Time.now}")
  end

  'Simulated download'
end

get '/organise' do
  input = File.open("#{ENV['DOWNLOAD_PATH']}/downloaded.txt", 'r', &:read)

  output = "Organised:\n#{input}"

  File.open("#{ENV['CONSUMER_PATH']}/organised.txt", 'w') do |f|
    f.write(output)
  end

  'Organised'
end

get '/consume' do
  File.open("#{ENV['CONSUMER_PATH']}/organised.txt", 'r', &:read)
end
