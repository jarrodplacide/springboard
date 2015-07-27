module ApplicationHelper
	def password_confirm?(password, password_confirm)
		if password == password_confirm
			return true
		else
			return false
		end
	end
end
