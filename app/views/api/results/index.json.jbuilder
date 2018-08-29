json.array! @exams.each do |exam|
  json.id exam.id
  json.user_ids exam.user_ids.first
  json.name exam.name
end

json.array! @lab_tests.each do |lab_test|
  json.id lab_test.id
  json.name lab_test.name
  json.normal_low_end lab_test.normal_low_end
  json.normal_high_end lab_test.normal_high_end
end

json.array! @shots.each do |shot|
  json.id shot.id
  json.name shot.name
end


json.array! @vitals.each do |vital|
  json.id vital.id
  json.name vital.name
end
