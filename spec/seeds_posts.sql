TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO posts (title, contents, number_of_views, user_account_id) VALUES ('first post', 'random words', 34, 2);
INSERT INTO posts (title, contents, number_of_views, user_account_id) VALUES ('second post', 'carefully chosen words', 344, 1);