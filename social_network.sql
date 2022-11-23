CREATE TABLE user_accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text
);
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  contents text,
  number_of_views int,
  user_account_id int
--   constraint fk_user_account foreign key(user_account_id)
--     references user_accounts(id)
--     on delete cascade
);

