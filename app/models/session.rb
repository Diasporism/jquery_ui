class Session < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
  columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  attr_accessible :username, :password

  validate :make_it_fail

  column :username, :string
  column :password, :string

  protected
  def make_it_fail
    errors.add(:session, 'This message will only show if login failed for legit reasons!')
  end
end
