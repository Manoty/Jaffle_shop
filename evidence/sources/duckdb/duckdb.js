import Database from "duckdb";

const db = new Database.Database(
  "../target/jaffle_shop.duckdb"
);

export const duckdb = db;
