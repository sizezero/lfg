# coding: utf-8
require 'squib'

data = Squib.csv file: 'armor.csv'

# default size for Deck.new appears to be for portrait poker card
# inverting for landscape
Squib::Deck.new(cards: data['name'].size, width: 1125, height: 825, layout: 'layouts/layout.yml') do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'

  text str: data['name'], layout: 'title'
  text str: data['stars'], layout: 'stars'
  text markup: true, str: data['vp'].map { |s| s&.gsub(':vp:','<span foreground="#5e11a6">🎖</span>') }, layout: 'vp'

  save_sheet prefix: 'armor', columns: 3, dir: 'output'
  save_pdf trim: 37.5, dir: 'output'
end
