module PostsHelper
	def post_content_truncate(post)
		post = post.truncate(100)
	end
end
