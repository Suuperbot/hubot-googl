# hubot-googl

[![Build Status](https://travis-ci.org/ClaudeBot/hubot-googl.svg)](https://travis-ci.org/ClaudeBot/hubot-googl)
[![devDependency Status](https://david-dm.org/ClaudeBot/hubot-googl/dev-status.svg)](https://david-dm.org/ClaudeBot/hubot-googl#info=devDependencies)

A Hubot script for generating short [goo.gl](https://goo.gl/) URLs with public click analytics.

See [`src/googl.coffee`](src/googl.coffee) for full documentation.


## Installation via NPM

1. Install the __hubot-googl__ module as a Hubot dependency by running:

    ```
    npm install --save hubot-googl
    ```

2. Enable the module by adding the __hubot-googl__ entry to your `external-scripts.json` file:

    ```json
    [
        "hubot-googl"
    ]
    ```

3. Run your bot and see below for available config / commands


## Configuration

Variable | Default | Description
--- | --- | ---
`GOOGLE_API_KEY` | N/A | A unique developer [API key](https://developers.google.com/url-shortener/v1/getting_started#auth) is required to use Google's URL Shortener API


## Commands

Command | Description
--- | ---
hubot shorten `url` | Creates a new short URL with `url`


## Sample Interaction

```
user1>> hubot shorten http://docs.gl/
hubot>> user1: http://goo.gl/b2ddNc
```
