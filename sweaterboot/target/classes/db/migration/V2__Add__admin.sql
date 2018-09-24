insert into user (id, username, password, active, email)
      values (1, 'MelkyEA', '$2a$08$IJIxzOQ3s5Ihxz9LlAQXx.R4OfwgVzrmM8Daj6zH3t5S0ULA9TtG6', true, 'melk1yea@gmail.com');

INSERT INTO user_role (user_id, roles)
      VALUES (1, 'USER'), (1, 'ADMIN');