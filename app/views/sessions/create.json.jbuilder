json.data do
  json.email @user.email
  json.auth_token @auth_token
end
json.response do
  json.code 200
end
