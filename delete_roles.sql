-- delete all of the roles associated with `team_collaborator`
delete from roles
where roles.name = 'team_collaborator';
