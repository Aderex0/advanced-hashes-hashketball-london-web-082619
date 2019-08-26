require "pry"

def game_hash
  game = { 
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10, 
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    } 
  }
end

def num_points_scored(player_name)
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if player == player_name
        return stats[:points]
      end
    end  
  end
end

def shoe_size(player_name)
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if player == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, info|
    if team_name == info[:team_name]
      return info[:colors]
    end
  end
end

def team_names
  teams_playing = []
  game_hash.each do |team, info|
    teams_playing << info[:team_name]
  end
  teams_playing
end

def player_numbers(team_name)
  players_playing = []
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if team_name == info[:team_name]
        players_playing << stats[:number]
      end
    end
  end
  players_playing
end

def player_stats(player_name)
  stats_sheet = {}
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if player_name == player
        stats_sheet = stats
      end
    end
  end
  stats_sheet
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_point_player = ""
  points = 0
  game_hash.each do |team, info|
    info[:players].each do |player, stats|
      if stats[:points] > points
        points = stats[:points]
        most_point_player = player
      end
    end
  end
  most_point_player
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  winning_team = nil
  game_hash[:home][:players].each do |team, info|
    home_team_points += info[:points]
  end
  game_hash[:away][:players].each do |team, info|
    away_team_points += info[:points]
  end
  if home_team_points > away_team_points
    winning_team = game_hash[:home][:team_name]
  else
    winning_team = game_hash[:away][:team_name]
  end
  winning_team
end

def player_with_longest_name
  longest_name_length = 0 
  longest_name = ""
  game_hash.reduce({}) do |memo, (key, value)|
    a = game_hash[key]  
    a[:players].reduce({}) do |memo, (key, value)|
      if key.length > longest_name_length
        longest_name_length = key.length
        longest_name = key
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  name_with_steal = nil
  steal_number = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if value[:steals] > steal_number
        steal_number = value[:steals]
        name_with_steal = name
      end
    end
  end
  name_with_steal == player_with_longest_name
end 