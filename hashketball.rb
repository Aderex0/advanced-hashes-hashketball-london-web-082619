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
    info[:players].each do |players, stats|
      if player_name == players
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if player_name == players
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, info|
    if info[:team_name] == (team_name)
      return info[:colors]
    end
  end
end

def player_numbers(team_names)
  player_numbers = []
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if info[:team_name] == team_names
        player_numbers << stats[:number]
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  player_boxscore = {}
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if players == player_name
        player_boxscore = stats
      end
    end
  end
  player_boxscore
end

def big_shoe_rebounds
  shoe_size = 0
  largest_shoe_rebounds = 0
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        largest_shoe_rebounds = stats[:rebounds]
      end
    end
  end
  largest_shoe_rebounds
end

def most_points_scored
  points_scored = 0
  player_with_most_points = nil
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if stats[:points] > points_scored
        points_scored = stats[:points]
        player_with_most_points = players
      end
    end
  end
  player_with_most_points
end

def winning_team
  home_team_points = 0
  away_team_points = 0
  winning_team = ""
  game_hash[:home][:players].each do |players, stats|
    home_team_points += stats[:points]
  end
  game_hash[:away][:players].each do |players, stats|
    away_team_points += stats[:points]
  end
  if home_team_points > away_team_points
    winning_team = game_hash[:home][:team_name]
  else
    winning_team = game_hash[:away][:team_name]
  end
  winning_team
end

def player_with_longest_name
  name_length = 0
  longest_name_player = nil
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if players.length > name_length
        name_length = players.length
        longest_name_player = players
      end
    end
  end
  longest_name_player
end

def long_name_steals_a_ton?(longest_player_name)
  steals = 0
  player_with_most_steals = nil
  game_hash.each do |team, info|
    info[:players].each do |players, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        player_with_most_steals = players
      end
    end
  end
  longest_player_name == player_with_most_steals
end