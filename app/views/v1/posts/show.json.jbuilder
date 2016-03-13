json.data do
  json.id   @post.id
  json.title @post.title
  json.content @post.content
end
json.links do
  json.self post_url(@post)
end
