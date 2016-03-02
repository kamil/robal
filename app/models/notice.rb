class Notice
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  before_create :assign_problem

  field :fingerprint, type: String

  belongs_to :problem


  def assign_problem
    self.fingerprint = Digest::MD5.hexdigest( self._errors.to_s + self.environment.to_s )
    self.problem = Problem.find_or_create_by(fingerprint: self.fingerprint)
  end



end
