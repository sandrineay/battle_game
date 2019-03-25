puts 'Delete existing data'

Battle.destroy_all
Player.destroy_all

puts 'Create first 3 players'

player = Player.new(name: 'Gandalf', strength_points: 2, intelligence_points: 4, magic_points: 4)
player.remote_picture_url = 'https://raw.githubusercontent.com/sandrineay/pdv-images/master/gandalf.png'
player.save

player = Player.create(name: 'Aragorn', strength_points: 4, intelligence_points: 5, magic_points: 1)
player.remote_picture_url = 'https://raw.githubusercontent.com/sandrineay/pdv-images/master/aragorn.png'
player.save

player = Player.create(name: 'Uruk Hai', strength_points: 7, intelligence_points: 2, magic_points: 1)
player.remote_picture_url = 'https://raw.githubusercontent.com/sandrineay/pdv-images/master/uruk-hai.png'
player.save

puts "Created #{Player.count} players: #{Player.first.name}, #{Player.second.name} and #{Player.third.name} 👌"
