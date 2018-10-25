require "pry"

def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  season_winner = ""
  contestants.each do |stats|
    if stats["status"] == "Winner"
      season_winner = stats["name"]
    end
  end
  name_array = season_winner.split
  name_array[0]
end

def get_contestant_name(data, occupation)
  contestant_name = ""
  data.each do |season, stats|
    stats.each do |hash|
      if hash["occupation"] == occupation
        contestant_name = hash["name"]
      end
    end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do |season, stats|
    stats.each do |hash|
      if hash["hometown"] == hometown
        hometown_count += 1
      end
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
  occupation = ""
  data.each do |season, stats|
    stats.each do |hash|
      if hash["hometown"] == hometown
        occupation = hash["occupation"]
        return occupation
      end
    end
  end
end

def get_average_age_for_season(data, season)
  contestants = data[season]
  number_of_contestants = contestants.length
  total_age = 0
  contestants.each do |stats|
    total_age += stats["age"].to_i
  end
  float_total = total_age.to_f
  average_age = float_total / number_of_contestants
  return average_age.round
end
