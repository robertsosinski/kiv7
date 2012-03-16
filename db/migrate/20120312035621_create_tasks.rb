class CreateTasks < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table tasks (
        id serial primary key,
        user_id int not null references users,
        name varchar,
        done boolean default false not null,
        created_at timestamp,
        updated_at timestamp
      );
    SQL
  end
  
  def down
    execute <<-SQL
      drop table tasks;
    SQL
  end
end
