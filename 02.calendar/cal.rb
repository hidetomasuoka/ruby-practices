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


year  = Date.today.year if year.nil?
month = Date.today.month if month.nil?

calendar_header = "#{month}月 #{year}"

first_day = Date.new(year.to_i, month.to_i, 1).day
last_day = Date.new(year.to_i, month.to_i, -1).day
space=" "
week=""
(first_day..last_day).each do |day|
  days_week = Date.new(year.to_i, month.to_i, day).cwday 

  if day==first_day 
    first_day_week = Date.new(year.to_i, month.to_i, 1).cwday 
    if first_day_week ==7
      week=[week,day].join(space*(first_day_week*2))
    else
      week=[week,day].join(space*(first_day_week*2+4))
    end
  end
  if first_day < day && day < 10 && days_week != 7 
    week=[week,day].join(space*2)
  end
  if first_day < day && day < 10 && days_week == 7 
    week=[week,day].join(space)
  end
     
  if first_day < day && day >= 10 && days_week != 7 
    week=[week,day].join(space)
  end
  if  first_day < day && day >= 10 && days_week == 7 
    week.concat day.to_s
  end

  if days_week == 6 
    week.concat("\n")
  end
end


puts calendar_header.center(20)
puts ('Su Mo Tu We Th Fr Sa')
puts week
