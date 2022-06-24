class SecretDiary
  def initialize(diary)  
    @diary = diary
    @lock = true
  end

  def read
    fail "Go away!" if @lock == true
    return @diary
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false 
  end
end