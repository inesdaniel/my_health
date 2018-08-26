json.array! @dates.each do |old_dates|
  json.name old_dates.dates.name
  json.date_completed old_dates.date_completed.strftime("%m/%d/%Y")
  
end
