class ExistingPeeps

  def initialize(id, date, time, user_id, username, body)
    @id = id
    @date = date
    @time = time
    @user_id = user_id
    @username = username
    @body = body
  end

  attr_reader :id, :date, :time, :user_id, :username, :body
end
