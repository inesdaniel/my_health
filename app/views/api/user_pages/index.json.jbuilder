json.array! @user_pages.each do |result|
  json.name result.name
  # get date_completed to show for each item in array
  json.date_completed result.date_completed 
end