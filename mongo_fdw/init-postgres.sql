CREATE EXTENSION IF NOT EXISTS mongo_fdw;

CREATE SERVER mongo_svr
  FOREIGN DATA WRAPPER mongo_fdw
  OPTIONS (
    address 'mongodb',
    port '27017',
    authentication_database 'admin'  -- Bu kritik
  );

CREATE USER MAPPING FOR postgres
  SERVER mongo_svr
  OPTIONS (username 'root', password 'rootpass');

DROP FOREIGN TABLE IF EXISTS mongo_data;

CREATE FOREIGN TABLE mongo_data (
  _id text,
  name text
)
SERVER mongo_svr
OPTIONS (database 'test', collection 'deneme');
