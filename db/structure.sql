CREATE TABLE "account_games" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "game_id" integer, "account_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "name" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "editions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "game_id" integer, "editor_id" integer, "lang" varchar(255), "plateform" varchar(255), "out_date" date, "kind" varchar(255), "name" varchar(255));
CREATE TABLE "editors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "url" varchar(255), "lang" varchar(255), "country_id" integer, "logo" varchar(255));
CREATE TABLE "games" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "min" integer, "max" integer, "name" varchar(255), "target" varchar(255), "time" varchar(255), "level" integer DEFAULT 2, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "integer" active_edition_id);
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "image" varchar(255), "imageable_id" integer, "imageable_type" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "country_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "index_accounts_on_email" ON "accounts" ("email");
CREATE UNIQUE INDEX "index_accounts_on_reset_password_token" ON "accounts" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120124190511');

INSERT INTO schema_migrations (version) VALUES ('20120220184016');

INSERT INTO schema_migrations (version) VALUES ('20120220211505');

INSERT INTO schema_migrations (version) VALUES ('20120228220049');

INSERT INTO schema_migrations (version) VALUES ('20120228220454');

INSERT INTO schema_migrations (version) VALUES ('20120318125153');

INSERT INTO schema_migrations (version) VALUES ('20120318130053');

INSERT INTO schema_migrations (version) VALUES ('20120319205901');

INSERT INTO schema_migrations (version) VALUES ('20120323204932');

INSERT INTO schema_migrations (version) VALUES ('20120325131125');

INSERT INTO schema_migrations (version) VALUES ('20120325135336');

INSERT INTO schema_migrations (version) VALUES ('20120402190642');

INSERT INTO schema_migrations (version) VALUES ('20120429092528');