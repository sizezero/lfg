require 'squib'

data = Squib.csv file: 'armor.csv'

# default size for Deck.new appears to be for portrait poker card
# inverting for landscape
Squib::Deck.new(cards: data['name'].size, width: 1125, height: 825, layout: 'layouts/layout.yml') do
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  text str: data['name'], layout: 'title'

  save_sheet prefix: 'armor', columns: 3, dir: 'output'
  save_pdf trim: 37.5, dir: 'output'
end
