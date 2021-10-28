namespace :comment do
	desc "Accept comments older than 2 days"
	task accept_comment: :environment do
  	puts "#{Comment.accept_comment} comments have been accepted!"
	end
end	