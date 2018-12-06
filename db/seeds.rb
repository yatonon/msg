# ユーザーを10人ほど
1.upto(10) do |i|
  User.create(email: "tmp#{i}@tmp.com", password: 'tmptmp', name: "tmp#{i}", user_original: "uniq#{i}")
end
# ユーザー1の友達を5人ほど
2.upto(6) do |i|
  Friend.create(user_id: 1, establish: true, apply: true, to_id: i)
end
# ユーザー1に申請してる輩
7.upto(10) do |i|
  Friend.create(user_id: i, establish: true, apply: true, to_id: 1)
end
# ユーザー1の友達を5人ほど
2.upto(6) do |i|
  Friend.create(user_id: 1, establish: true, apply: true, to_id: i)
end
# ユーザー1に申請してる輩
7.upto(10) do |i|
  Friend.create(user_id: i, establish: true, apply: true, to_id: 1)
end
