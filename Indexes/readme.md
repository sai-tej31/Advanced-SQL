# Indexes

- SQL indexes are designed to improve database performance by enabling efficient data retrieval, reducing the amount of data scanned during queries.
- They are created on one or more columns of a database table, where a separate organized structure contains a copy of the indexed data for quick lookups.
- Indexes function like a book's index, allowing the database engine to easily locate relevant data when executing queries involving the indexed columns.


## Types of Indexes

There are several types of indexes like clustered index, non-clustered index, unique, hash, memory-optimised non-clustered, filtered, etc.


### Let's talk about Clustered and Non-clustered indexes.

- **Clustered Index:**

- - Sorts the data in the table based on indexed column(s).
- - A table can have atmost one clustered index, usually applied to primary key column(s) of the table.


- **Non-clustered Index:**

- - Creates a separate list of indexed data, and does not impact physical data order of the table.
- - There can be multiple non-clustered indexes for multiple columns within the same table.

### Additional
- - If the table has a clustered index, then non-clustered index locate to the clustered index key, else index locates to the row from the table. 
- - Clustered index is faster than Non-clustered index.
- - Both Clustered and non-clustered index can be unique.
- - All the columns queried present in the index (composite index), returns directly from index without looking at the table, it is called **covering query**.
- - Query on clustered index always is a covering query.


### Advantages
- select, delete, update query performance is optimized.
- Indexes help retrieve the data in sorted order. (since index is already sorted)
- Query performance is improved when grouping or joining on the indexed columns. 

### Disadvantages
- Indexes takes up additional disk storage. (clustered index does not require addidtional storage, since the data is sorted in place)
- Having too many indexes can hurt the performance, when DML statements are executed, to modify the data, since all the indexes needs to be updated.
