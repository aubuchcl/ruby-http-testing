require 'httparty'
require 'securerandom'

ENDPOINTS = [
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
   'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random',
  'http://cname.chrisaubuchon.com/api/breeds/image/random'
]

HEADERS = {
  "User-Agent" => "BatchRequesterBot/1.0",
  "Accept" => "application/json"
}

def random_batch
  ENDPOINTS.shuffle.sample(rand(40..50))
end

loop do
  puts "🕒 Starting new batch at #{Time.now}..."

  threads = random_batch.map do |url|
    Thread.new do
      begin
        response = HTTParty.get(url, headers: HEADERS)
        puts "✅ [#{url}] #{response.code}"
      rescue => e
        puts "❌ [#{url}] Error: #{e.message}"
      end
    end
  end

  threads.each(&:join)

  wait_time = rand(45..300) 
  puts "⏳ Sleeping for #{wait_time} seconds..."
  sleep(wait_time)
end
