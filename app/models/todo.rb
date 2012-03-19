class Todo
  include MongoMapper::Document

  key :name, String
  key :deadline, DateTime
  key :done, Boolean, :default => false
  timestamps!
  
  scope :late, lambda { sort(:name).where(:deadline => { '$lt' => Time.now}, :done => false) }
  scope :uncompleted, sort(:name).where(:done => false)
  
  validates_presence_of :name
  validates_presence_of :deadline
end
