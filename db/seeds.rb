Person.delete_all

64.times do
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  job_title = FFaker::Job.title
  bio = FFaker::Lorem.paragraph
  department = Person::DEPARTMENTS.sample
  Person.create! name: name, job_title: job_title, bio: bio, department: department
end
