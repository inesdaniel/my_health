json.array! @exams.each do |exam|
  json.name exam.name
end

json.array! @lab_tests.each do |lab_test|
  json.name lab_test.name
  json.normal_low_end lab_test.normal_low_end
  json.normal_high_end lab_test.normal_high_end
end

json.array! @shots.each do |shot|
  json.name shot.name
end


json.array! @vitals.each do |vital|
  json.name vital.name
end
