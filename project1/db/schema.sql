DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS transactions;

CREATE TABLE account(
  id             SERIAL PRIMARY KEY,
  name           TEXT NOT NULL,
  balance        MONEY NOT NULL
);

CREATE TABLE transactions(
  id              SERIAL PRIMARY KEY,
  payee           TEXT NOT NULL,
  amount          MONEY NOT NULL,
  date            BOOLEAN NOT NULL,
  category        INTEGER NOT NULL,
  account_id      INTEGER NOT NULL
);
