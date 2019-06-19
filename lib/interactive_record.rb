require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord

  def self.table_name 
    self.to_s.downcase.pluralize
  end 
  
  def self.column_names
    column_names = [] 
    
    sql = "PRAGMA table_info('#{table_names}')" 
    table_info = DB[:conn].execute(sql) 
    
    table_info.each do |col| 
      column_names << col["name"] 
    end 
    column_names.compact 
  end 
  
  def initialize(options = {})
    options.each do |
end