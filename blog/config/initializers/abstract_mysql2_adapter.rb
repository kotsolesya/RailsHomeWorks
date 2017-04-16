# require 'active_record/connection_adapters/mysql2_adapter'
#
# class ActiveRecord::ConnectionAdapters::Mysql2Adapter
#   NATIVE_DATABASE_TYPES[:primary_key] = "int(11) auto_increment PRIMARY KEY"
# end
require 'active_record/connection_adapters/abstract_mysql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class Mysql2Adapter < AbstractMysqlAdapter
      NATIVE_DATABASE_TYPES[:primary_key] = "int(11) auto_increment PRIMARY KEY"
    end
  end
end
