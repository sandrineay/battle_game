puts 'Create first 3 players'

Player.create(name: 'Gandalf', strength_points: 2, intelligence_points: 4, magic_points: 4)
Player.create(name: 'Aragorn', strength_points: 4, intelligence_points: 5, magic_points: 1)
Player.create(name: 'Uruk Hai', strength_points: 7, intelligence_points: 2, magic_points: 1)

puts "Created #{Player.count} players: #{Player.first.name}, #{Player.second.name} and #{Player.third.name} 👌"
