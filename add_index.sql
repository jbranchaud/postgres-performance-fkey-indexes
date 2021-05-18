-- add an index to `users_roles.role_id`
create index concurrently role_id_index
  on users_roles (role_id);
