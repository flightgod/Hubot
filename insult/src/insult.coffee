# Description:
#   Dev excuses scraper. From http://developerexcuses.com/
#
# Dependencies:
#
#   "cheerio": "~0.12.0"
#
# Commands:
#   hubot insult me

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /insult (.*)/i, (msg) ->
    name = msg.match[1].trim()
    insult(msg, name)

insult = (msg, name) ->
  msg
    .http("http://www.randominsults.net")
    .get() (err, res, body) ->
      msg.send "#{name}: #{getQuote body}"

getQuote = (body) ->
  $ = cheerio.load(body)
  $('i').text()
