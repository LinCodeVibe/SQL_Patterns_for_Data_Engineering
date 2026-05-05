# LeetCode 175 – Combine Two Tables

## 📌 Problem Link

https://leetcode.com/problems/combine-two-tables/

---

## Problem Summary

We are given two tables:

* **Person**

  * personId (Primary Key)
  * firstName
  * lastName

* **Address**

  * addressId (Primary Key)
  * personId (Foreign Key)
  * city
  * state

The goal is to **combine both tables** and return:

* firstName
* lastName
* city
* state

Even if a person does **not have an address**, they should still appear in the result

---

## Key Insight

This is a classic **LEFT JOIN problem**.

* We must keep **all records from Person**
* Address is optional → may be NULL

Therefore:

* Use `LEFT JOIN` (NOT INNER JOIN)

---

## SQL Solution

```sql
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
```

---

## Explanation

* `Person p` → main table (left side)
* `LEFT JOIN Address a`

  * Keeps all rows from Person
  * Fills NULL if no match in Address
* `ON p.personId = a.personId`

  * Join condition

---

## Example Output

| firstName | lastName | city     | state |
| --------- | -------- | -------- | ----- |
| Allen     | Wang     | NULL     | NULL  |
| Bob       | Alice    | New York | NY    |

---

## Concepts Practiced

* LEFT JOIN
* Handling NULL values
* Foreign key relationships

---

## Takeaway

Use **LEFT JOIN when you must keep all records from one table**, even if the other table has missing data.

---

## Patterns

`SQL` `JOIN` 
