class CreateUsers < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table users (
        id serial primary key,
        name varchar(10) not null,
        admin boolean default false not null,
        password_digest varchar(60) not null
      );
      
      create unique index users_name_idx on users (name);
    SQL
  end
  
  def down
    execute <<-SQL
      drop table users;
    SQL
  end
end
