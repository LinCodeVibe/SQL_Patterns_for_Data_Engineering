# LeetCode 176 – Second Highest Salary

## Problem

https://leetcode.com/problems/second-highest-salary/

---

## Problem Summary

We are given a table:

### Employee

* id (Primary Key)
* salary

Task:
Return the **second highest DISTINCT salary**.

If no second highest salary exists → return **NULL**

---

## Key Insight

We need:

1. **Distinct salaries** (remove duplicates)
2. Sorted in **descending order**
3. Select the **second value**

---

## SQL Solution

```sql
SELECT 
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;
```

---

## Explanation

### Step 1: Remove duplicates

```sql
SELECT DISTINCT salary FROM Employee
```

Ensures repeated salaries are not counted multiple times.

---

### Step 2: Sort salaries (highest first)

```sql
ORDER BY salary DESC
```

---

### Step 3: Skip the highest, take the next

```sql
LIMIT 1 OFFSET 1
```

Meaning:

* OFFSET 1 → skip highest salary
* LIMIT 1 → return next value

---

### Step 4: Wrap with outer SELECT

```sql
SELECT ( ... ) AS SecondHighestSalary
```

Ensures:

* Always returns one row
* Returns **NULL** if no second highest exists

---

## Example

### Input:

```
100, 200, 300
```

### Output:

```
200
```

---

### Edge Case

### Input:

```
100
```

### Output:

```
NULL
```

---

## Alternative Solutions

### Using MAX()

```sql
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
```

---

## Concepts Practiced

* DISTINCT
* ORDER BY
* LIMIT + OFFSET
* Subqueries

---

## Takeaway

To find the **Nth highest value**:

* Use `ORDER BY + LIMIT/OFFSET`
* Or `MAX() + subquery`

---

## Tags

`SQL` `Subquery`  `Data Engineering` 
