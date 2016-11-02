class Message < ActiveRecord::Base

	after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new

  def set_defaults
    self.weight  = 1
    self.complete = false
  end


   # validates :body, length: { minimum: 50 }

end
