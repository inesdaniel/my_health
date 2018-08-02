json.array! @shots.each do |shot|
  json.name shot.name
  json.date_given shot.date_given
  json.user_id shot.user_id
 
end

json.array! @exams.each do |exam|
  json.name exam.name
  json.date_completed exam.date_completed
  json.user_id exam.user_id
end

json.array! @vitals.each do |vital|
  json.name vital.name
  json.reading vital.reading
  json.user_id vital.user_id
end