CREATE SEQUENCE IF NOT EXISTS PUBLIC.CAR_SEQ START WITH 9500 INCREMENT BY 500;
CREATE SEQUENCE IF NOT EXISTS PUBLIC.MODEL_SEQ START WITH 500 INCREMENT BY 500;
CREATE SEQUENCE IF NOT EXISTS PUBLIC.PRODUCER_SEQ START WITH 1000 INCREMENT BY 500;
CREATE CACHED TABLE IF NOT EXISTS PUBLIC.PRODUCERS(
  PRODUCER_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.PRODUCER_SEQ) NOT NULL,
  PRODUCER_NAME VARCHAR(50) NOT NULL
);
ALTER TABLE PUBLIC.PRODUCERS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_6 PRIMARY KEY(PRODUCER_ID);
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.PRODUCERS;
CREATE CACHED TABLE IF NOT EXISTS PUBLIC.MODELS(
  MODEL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.MODEL_SEQ) NOT NULL,
  PRODUCER_ID BIGINT NOT NULL,
  MODEL_NAME VARCHAR(50) NOT NULL
);
ALTER TABLE PUBLIC.MODELS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_8 PRIMARY KEY(MODEL_ID);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.MODELS;
CREATE CACHED TABLE IF NOT EXISTS PUBLIC.CARS(
  CAR_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.CAR_SEQ) NOT NULL,
  PRODUCER_ID BIGINT NOT NULL,
  MODEL_ID BIGINT NOT NULL,
  PRODUCTION_YEAR DATE,
  FUEL VARCHAR(50) NOT NULL,
  TRANSMISSION VARCHAR(50) NOT NULL
);
ALTER TABLE PUBLIC.CARS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_1 PRIMARY KEY(CAR_ID);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.CARS;
ALTER TABLE PUBLIC.MODELS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_87 FOREIGN KEY(PRODUCER_ID) REFERENCES PUBLIC.PRODUCERS(PRODUCER_ID) NOCHECK;
ALTER TABLE PUBLIC.CARS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_1F FOREIGN KEY(PRODUCER_ID) REFERENCES PUBLIC.PRODUCERS(PRODUCER_ID) NOCHECK;
ALTER TABLE PUBLIC.CARS ADD CONSTRAINT IF NOT EXISTS PUBLIC.CONSTRAINT_1F7 FOREIGN KEY(MODEL_ID) REFERENCES PUBLIC.MODELS(MODEL_ID) NOCHECK;

