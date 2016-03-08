module Errors
  
  # Returns @errors
  def get_errors
    return @errors
  end

  # Checks if the record is valid.
  # 
  # Returns Boolean.
  def is_valid
    self.set_errors
    if @errors.length > 0
      return false
    else
      return true
    end
  end
end
