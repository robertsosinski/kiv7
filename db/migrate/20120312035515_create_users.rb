class CreateUsers < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table users (
        id serial primary key,
        name varchar,
        password_digest varchar
      );
    SQL
  end
  
  def down
    execute <<-SQL
      drop table users;
    SQL
  end
end
