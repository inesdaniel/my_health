# json.array! @user_pages.each do |result|
#   json.name result.name

# end

json.array! @user_shots.each do |user_shot|
  json.user_id user_shot.user_id
  json.shot_id user_shot.shot_id
  json.shot_name user_shot.shot.name
  json.date_completed user_shot.date_completed
  
end

json.array! @user_vitals.each do |user_vital|
  json.user_id user_vital.user_id
  json.vital_id user_vital.vital_id
  json.vital_name user_vital.vital.name
  json.date_completed user_vital.date_completed
  json.result user_vital.result
  
end