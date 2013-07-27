Ifbyphone XML Generator
=======================

[![Build Status](https://travis-ci.org/Opus1no2/Ifbyphone-Responses-Gem.png)](https://travis-ci.org/Opus1no2/Ifbyphone-Responses-Gem)
 
A simple interface for creating valid Ifbyphone XML strucures

Installation
------------

```sh
gem install ifbyphone_response
```

Usage
-----

Using the gem is easy:

```ruby

require 'ifbyphone_response'

route = Route.new

# Performa a blind transfer
route.transfer(952457****)

# Route to an IVR
route.survo(1234)

# Route to a voicemail
route.voicemail(5555)

# Gracefully end a call
route.hangup

```

License
--------
MIT
