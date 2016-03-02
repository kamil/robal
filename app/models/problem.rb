class Problem
  include Mongoid::Document
  field :fingerprint, type: String

  has_many :notices
end
