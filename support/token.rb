# Use to got random value
# Useful to post a data with random string but keep the value to check it later
# Author:: Fabrice
class Token
  # Create a new token
  # Author:: Fabrice
  def initialize
    @value = 256*256+rand(1024*1024)
  end

  # Get the value of the last token
  # Author:: Fabrice
  def value
    @value
  end
end
