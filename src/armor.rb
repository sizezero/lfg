# coding: utf-8
require 'squib'

data = Squib.csv file: 'armor.csv'

metal2color = { ':gold:'=>'#ffd700', ':silver:'=>'#c0c0c0', ':bronze:'=>'#b87333' }
metal2color.default = '#000000'

# default size for Deck.new appears to be for portrait poker card
# inverting for landscape
Squib::Deck.new(cards: data['name'].size, width: 1125, height: 825, layout: 'layouts/layout.yml') do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'

  text str: data['name'], layout: 'title'
  coloredStars = data['stars'].zip(data['tier']).map { |a| a[0]==nil ? '' : '<span foreground="'+metal2color[a[1]]+'">'+('✪'*a[0])+'</span>'}
  puts coloredStars.inspect
  text markup: true, str: coloredStars, layout: 'stars'
  text markup: true, str: data['vp'].map { |s| s&.gsub(':vp:','<span foreground="#5e11a6">🎖</span>') }, layout: 'vp'

  save_sheet prefix: 'armor', columns: 3, dir: 'output'
  save_pdf trim: 37.5, dir: 'output'
end
