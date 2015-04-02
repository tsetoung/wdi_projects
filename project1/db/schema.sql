DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

CREATE TABLE accounts (
  id             SERIAL PRIMARY KEY,
  name           TEXT NOT NULL,
  category       TEXT NOT NULL
);

CREATE TABLE transactions (
  id              SERIAL PRIMARY KEY,
  name            TEXT NOT NULL,
  amount          INTEGER,
  category        TEXT NOT NULL,
  date            TIME,
  account_id      INTEGER
);
