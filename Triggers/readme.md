# Triggers

Trigger is a code that runs automatically when something happens in a database table. Triggers are linked to a specific table, If the table is deleted, its triggers are also removed.
- Triggers can be executed when there is any change to the table.
- - INSERT: When a new row of information is added.
- - UPDATE: When an already existing info is changed.
- - DELETE: When an already existing row is to be deleted.


## Types of Triggers:
In **sql server** above mentioned dml triggers are further divided into two Types:
- After Triggers:
- - Triggers after any of the above actions like INSERT, UPDATE, and DELETE are performed on the database. Triggers act after the action is done.
- Instead Of Triggers:
- Triggered in place of an action. These are fired when the above actions like INSERT, UPDATE, and DELETE are **supposed to happen**. They work instead of the actual action.

- **Note:** inserted and deleted are the special tables created inside DML triggers, based on the action. inserted and deleted table struture will be similar to the original table structure on which trigger is created.

