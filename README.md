
# Looking for Group

This is a subset of my board game in development named "Looking for Group". The original cards were rendered via libreoffice but the maintenance proved difficult. This project is an attempt to build a subset of the cards with a card building framework named "squib".

http://squib.rocks/

# Dependencies

I had to do the following to a stock install of Ubuntu 17.04

```bash
$ sudo apt-get install ruby
$ sudo apt-get install ruby-dev
$ sudo gem install rake
$ sudo gem install squib
```

# Building

```bash
$ ruby src/armor.rb
```

The results can be found in output/output.pdf  When printing be sure configure the printer not to scale the output.
