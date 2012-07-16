module PhoneHelper

  # Dummy phone numbers formating
  def phone_number(number)
    regex = /^(\+\d{2}\s?\d{1}\s?|\d{2})\s?(\d{2})\s?(\d{2})\s?(\d{2})\s?(\d{2})$/i
    if m = number.match(regex)
      regex = /^(\+\d{2})(\d){1}$/i
      if mm = m[1].strip.match(regex)
        return "#{mm[1]} #{mm[2]} #{m[2]} #{m[3]} #{m[4]} #{m[5]}"
      else
        return "#{m[1].strip} #{m[2]} #{m[3]} #{m[4]} #{m[5]}"
      end
    end

    return number
  end
end

