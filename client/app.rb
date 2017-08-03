require 'faraday'

URLS = [
  'http://localhost:4567',
  'http://localhost:4568'
]

def api_linear
  p "REMOTE CALL WITHOUT THREADS"
  measure do
    URLS
      .map { |url| Faraday.get url }
      .map(&:status)
  end
end

def api_threaded
  p "REMOTE CALL WITH THREADS"
  measure do
    URLS
      .map { |url| Thread.new { Faraday.get(url) } }
      .map(&:value)
      .map(&:status)
  end
end

def op_linear
  p "CODE EXECUTION WITHOUT THREADS"
  measure do
    2.times.map do
      start_counting
    end
  end
end

def op_threaded
  p "CODE EXECUTION WITH THREADS"
  measure do
    2.times.map do
      Thread.new { start_counting }
    end.map(&:value)
  end
end

def start_counting
  counter = 0
  100_000_000.times do
    counter += 1
  end
  counter
end

def measure
  start_time = Time.now
  result = yield
  end_time = Time.now

  puts result
  puts "Total time: #{end_time - start_time}"

  p "--------------------"
end

api_linear()
api_threaded()

op_linear()
op_threaded()
