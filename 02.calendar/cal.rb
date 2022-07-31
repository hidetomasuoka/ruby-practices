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
firstday_wday = Date.new(year.to_i,month.to_i,1).wday

puts calendar_header.center(20)
puts ('Su Mo Tu We Th Fr Sa')
print "   " * firstday_wday 


((Date.new(year.to_i, month.to_i, 1).day)..(Date.new(year.to_i, month.to_i, -1).day)).each do |day|

  dow=Date.new(year.to_i,month.to_i,day).wday
  if dow%7==0
    print "\n"
  end
  print day.to_s.rjust(2) + " "  

end 

