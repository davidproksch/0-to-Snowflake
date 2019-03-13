--
-- BAR:  Extra Credit
--

--
-- Drop/Recover without going to a backup
--
drop table crimes;
undrop table crimes;

--
-- Purge the table!
--
truncate table crimes;

--
-- Nothing is there
--
select count(*) from crimes;

--
-- Recover before the TRUNCATE was executed
-- Get the statement id from the HISTORY tab in the UI.
-- Look for the TRUNCATE statement in HISTORY
--
create table clone_recover clone crimes before (statement => '');

--
-- We have our data back
--
select count(*) from clone_recover;

--
-- Out with old, in with the new
--
alter table clone_recover swap with crimes;

--
-- Trust, but verify
--
select count(*) from crimes;
