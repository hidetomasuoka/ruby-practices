#!/usr/bin/env ruby

require 'date'
require 'optparse'

opt = OptionParser.new

opt.on('-y')
opt.on('-m')

calendar=opt.parse!(ARGV)

year=calendar[0]
month=calendar[1]

# エラー対応を考えているがいったんコメント
=begin 
if year.is_a?(Integer) || month.is_a?(Integer)  then
  if year > 1970 || year < 2100 then
    e = Exception.new("年は1970 以上2100以下の数値をいれてください")
    rescue
    p e 
    end
end
  if month > 0 || month < 13 then
    e = Exception.new("月は1 以上12以下の数値をいれてください")
  rescue
    p e 
  end

elsif year.is_a?(String) || month.is_a?(String)  then
  e = Exception.new("数値をいれてください")
  rescue
    p e 
 
end
=end


if year.nil? then
  year=Date.today.strftime('%Y')
end
if  month.nil? then
  month=Date.today.strftime('%m')
end


calendar_header=[month,year].join("月 ")

last_day = Date.new(year.to_i, month.to_i, -1).strftime('%d')

for days in 1..last_day.to_i do
  days_week = Date.new(year.to_i, month.to_i, days).strftime('%a')

  if days ==1 then
    first_day_week = Date.new(year.to_i, month.to_i, 1).strftime('%a')
    if first_day_week== "Mon" then
      week=[week,days].join("    ")
    elsif first_day_week== "Tue" then
      week=[week,days].join("       ")
    elsif first_day_week== "Wed" then
      week=[week,days].join("          ")
    elsif first_day_week== "Thu" then
      week=[week,days].join("             ")
    elsif first_day_week== "Fri" then
      week=[week,days].join("                ")
    elsif first_day_week== "Sat" then
      week=[week,days].join("                   ")
    else 
      week=[week,days].join(" ")
    end
  elsif days < 10 && days_week != "Sun" then
    week=[week,days].join("  ")
  elsif days < 10 && days_week == "Sun" then
    week=[week,days].join(" ")
  end
     
  if days >= 10 && days_week != "Sun" then
    week=[week,days].join(" ")
  elsif  days >= 10 && days_week == "Sun" then
    week << days.to_s
  end

  if days_week == "Sat" then
    week<<"\n"
  end

end


puts calendar_header.center(20)
puts ('Su Mo Tu We Th Fr Sa')
puts week
