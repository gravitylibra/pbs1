-- This file is automatically generated using maintenance/generateSchemaChangeSql.php.
-- Source: maintenance/abstractSchemaChanges/patch-iwlinks-drop-iwl_prefix_from_title.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TEMPORARY TABLE /*_*/__temp__iwlinks AS
SELECT
  iwl_from,
  iwl_prefix,
  iwl_title
FROM /*_*/iwlinks;
DROP TABLE /*_*/iwlinks;


CREATE TABLE /*_*/iwlinks (
    iwl_from INTEGER UNSIGNED DEFAULT 0 NOT NULL,
    iwl_prefix BLOB DEFAULT '' NOT NULL,
    iwl_title BLOB DEFAULT '' NOT NULL,
    PRIMARY KEY(iwl_from, iwl_prefix, iwl_title)
  );
INSERT INTO /*_*/iwlinks (iwl_from, iwl_prefix, iwl_title)
SELECT
  iwl_from,
  iwl_prefix,
  iwl_title
FROM
  /*_*/__temp__iwlinks;
DROP TABLE /*_*/__temp__iwlinks;

CREATE INDEX iwl_prefix_title_from ON /*_*/iwlinks (iwl_prefix, iwl_title, iwl_from);