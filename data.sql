-- create 50,000 users
insert into users
select from generate_series(1,50000);

-- create 100,000 roles
insert into roles (
  name,
  resource_type,
  resource_id
)
select
  (array['admin', 'support', 'member'])[floor(random() * 3 + 1)],
  null,
  null
from generate_series(1,50000);

insert into roles (
  name,
  resource_type,
  resource_id
)
select
  'team_collaborator',
  'Team',
  floor(random() * 1000 + 1)
from generate_series(1,50000);

-- create 500,000 connections between users and roles
-- start with 225,000 random global roles
insert into users_roles (
  user_id,
  role_id
)
select
  floor(random() * 50000 + 1),
  floor(random() * 50000 + 1)
from generate_series(1,225000);

-- then 50,000 for the team collaborator role
insert into users_roles (
  user_id,
  role_id
)
select
  floor(random() * 50000 + 1),
  floor(50000 + g.id)
from generate_series(1,50000) as g(id);

-- then another 225,000 random global roles
insert into users_roles (
  user_id,
  role_id
)
select
  floor(random() * 50000 + 1),
  floor(random() * 50000 + 1)
from generate_series(1,225000);
