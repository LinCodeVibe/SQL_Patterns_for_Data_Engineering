# LeetCode 182 – Duplicate Emails

## Problem

https://leetcode.com/problems/duplicate-emails/

---

## Problem Summary

We are given a table:

### Person

* id (Primary Key)
* email

Task:
Report all email addresses that appear more than once.

---

## Key Insight

We need to:

1. Group rows by email
2. Count how many times each email appears
3. Return emails appearing more than once

So we use:

* `GROUP BY`
* `COUNT()`
* `HAVING`

---

## SQL Solution

```sql
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
```

---

## Explanation

### Step 1: Read data from the Person table

```sql
FROM Person
```

This specifies the table containing email data.

---

### Step 2: Group rows with the same email

```sql
GROUP BY email
```

Rows with identical emails are grouped together.

Example:

| id | email   |
|---:|---------|
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

After grouping:

| email   | count |
|---------|------:|
| a@b.com | 2 |
| c@d.com | 1 |

---

### Step 3: Count how many times each email appears

```sql
COUNT(email)
```

Counts the number of rows inside each email group.

---

### Step 4: Keep only duplicate emails

```sql
HAVING COUNT(email) > 1
```

Filters grouped results.

Only emails appearing more than once are returned.

---

### Step 5: Return the duplicate email

```sql
SELECT email
```

Outputs the duplicated email addresses.

---

## Example

### Input:

| id | email   |
|---:|---------|
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

### Output:

| email   |
|---------|
| a@b.com |

---

## Why a@b.com?

`a@b.com` appears two times in the table.

Since:

```text
COUNT(a@b.com) = 2
```

and:

```text
2 > 1
```

it is included in the result.

`c@d.com` appears only once, so it is excluded.



---

## Concepts Practiced

* SELECT
* GROUP BY
* COUNT()
* HAVING
* Aggregate Functions
* Duplicate Detection

---

## Takeaway

When detecting duplicates in SQL:

1. Group rows by the target column
2. Count occurrences
3. Use `HAVING` to filter repeated values

For this problem:

* `GROUP BY email` groups identical emails
* `COUNT(email)` counts occurrences
* `HAVING COUNT(email) > 1` keeps duplicates only

---

## Tags

`SQL` `GROUP BY` `HAVING` `COUNT`