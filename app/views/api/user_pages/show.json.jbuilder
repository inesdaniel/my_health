json.array! @user_shots.each do |user_shot|
  json.user_id user_shot.user_id
  json.shot_id user_shot.shot_id
  json.shot_name user_shot.shot.name
  json.date_completed user_shot.date_completed.strftime("%m/%d/%Y")
end

json.array! @dates.each do |old_dates|
  json.name old_dates.dates.name
  json.date_completed old_dates.date_completed.strftime("%m/%d/%Y")
  
end
