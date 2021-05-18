-- delete all the `users_roles` that are associated with `team_collaborator`
-- type roles in the `roles` table.
delete from users_roles
using roles
where users_roles.role_id = roles.id
  and roles.name = 'team_collaborator';
