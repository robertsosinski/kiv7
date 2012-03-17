class CreateUsers < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table users (
        id serial primary key,
        username varchar(10) unique not null,
        password_digest varchar(60) not null,
        admin boolean default false not null,
        created_at timestamp,
        updated_at timestamp
      );
    SQL
  end
  
  def down
    execute <<-SQL
      drop table users;
    SQL
  end
end
