1.upto(10) do |i|
  User.create(email: "tmp#{i}@tmp.com", password: 'tmptmp', name: "tmp#{i}", user_original: "uniq#{i}")
end
