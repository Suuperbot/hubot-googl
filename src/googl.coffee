# Description
#   Google URL Shortener API (goo.gl)
#
# Configuration:
#   GOOGLE_API_KEY
#
# Commands:
#   hubot shorten <url> - Creates a new short URL with <url>
#
# Author:
#   MrSaints

GOOGLE_API_KEY = process.env.GOOGLE_API_KEY

module.exports = (robot) ->
    if not GOOGLE_API_KEY?
        robot.logger.warning "hubot-googl: Missing GOOGLE_API_KEY in environment. Setting an API key is highly recommended."

    serverErr = "I'm unable to process your request at this time due to a server error. Please try again later."

    robot.respond /shorten (.+)/i, (res) ->
        data = JSON.stringify
            longUrl: encodeURIComponent(res.match[1])

        params = {}
        params.key = GOOGLE_API_KEY if GOOGLE_API_KEY?

        res.http("https://www.googleapis.com/urlshortener/v1/url")
            .query(params)
            .header("content-type", "application/json")
            .post(data) (err, postRes, body) ->
                robot.logger.debug "hubot-googl: #{body}"

                if err
                    res.reply serverErr
                    return robot.logger.error "hubot-googl: #{err}"

                try
                    resource = JSON.parse(body)
                    res.reply resource.id
                catch error
                    res.reply serverErr
                    return robot.logger.error "hubot-googl: #{error}"
