Factory.define :admin do |a|
  a.login 'william@kaka.com'
  a.name 'Bill'
  a.password 'top-secret'
end

Factory.define :tableCaptain do |tc|
  tc.login 'steve@169.com'
  tc.first_name 'Steven'
  tc.password 'secret'
end
