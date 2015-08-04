module ApplicationHelper
	def password_confirm?(password, password_confirm)
		if password == password_confirm
			return true
		else
			return false
		end
	end

	def age(dob)
		now = Time.now.utc.to_date
		now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
	end
end
