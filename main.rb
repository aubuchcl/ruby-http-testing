require 'httparty'
require 'securerandom'

ENDPOINTS = [
  'https://cname.chrisaubuchon.com/api/breeds/image/random',
  'https://cname.chrisaubuchon.com/api/breeds/image/random',
  'https://cname.chrisaubuchon.com/api/breeds/image/random',
  'https://cname.chrisaubuchon.com/api/breeds/image/random',
  'https://cname.chrisaubuchon.com/api/breeds/image/random',
]

HEADERS = {
  "User-Agent" => "BatchRequesterBot/1.0",
  "Accept" => "application/json"
}

def random_batch
  ENDPOINTS.shuffle.sample(rand(5..10))
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

  wait_time = rand(200..230) # 4 to 5 minutes
  puts "⏳ Sleeping for #{wait_time} seconds..."
  sleep(wait_time)
end
