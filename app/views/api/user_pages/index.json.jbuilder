# json.array! @user_pages.each do |result|
#   json.name result.name

# end

json.array! @user_shots.each do |user_shot|
  json.user_id user_shot.user_id
  json.shot_id user_shot.shot_id
  json.shot_name user_shot.shot.name
  json.date_completed user_shot.date_completed.strftime("%m/%d/%Y")
  
end

json.array! @user_vitals.each do |user_vital|
  json.user_id user_vital.user_id
  json.vital_id user_vital.vital_id
  json.vital_name user_vital.vital.name
  json.date_completed user_vital.date_completed.strftime("%m/%d/%Y")
  json.result user_vital.result
end

json.array! @user_exams.each do |user_exam|
  json.user_id user_exam.user_id
  json.exam_id user_exam.exam_id
  json.exam_name user_exam.exam.name
  json.date_completed user_exam.date_completed.strftime("%m/%d/%Y")
end

json.array! @user_lab_tests.each do |user_lab_test|
  json.user_id user_lab_test.user_id
  json.lab_test_id user_lab_test.lab_test_id
  json.lab_test_name user_lab_test.lab_test.name
  json.date_completed user_lab_test.date_completed.strftime("%m/%d/%Y")
  json.result user_lab_test.result
end