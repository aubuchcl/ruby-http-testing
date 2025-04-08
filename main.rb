require 'httparty'
require 'securerandom'

ENDPOINTS = [
  'https://httpbin.org/get',
  'https://jsonplaceholder.typicode.com/posts/1',
  'https://api.github.com',
  'https://api.agify.io/?name=michael',
  'https://dog.ceo/api/breeds/image/random',
  'https://randomuser.me/api/',
  'https://catfact.ninja/fact',
  'https://icanhazdadjoke.com/',
  'https://www.boredapi.com/api/activity',
  'https://api.coindesk.com/v1/bpi/currentprice.json'
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

  wait_time = rand(240..300) # 4 to 5 minutes
  puts "⏳ Sleeping for #{wait_time} seconds..."
  sleep(wait_time)
end
