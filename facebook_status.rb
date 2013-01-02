require "rubygems"
require "json"
require "open-uri"
require "blink1"  # https://github.com/ngs/rb-blink1#readme

url = "http://www.facebook.com/feeds/api_status.php"

url_content = open(url) {|f| f.read }
parsed = JSON.parse(url_content)

isHealthy = parsed["current"]["health"]

blink1 = Blink1.new
blink1.open
blink1.set_rgb(0, 0, 0)
blink1.fade_to_rgb(100, 255, 0, 0)
blink1.fade_to_rgb(100, 0, 0, 0)

blink1.close