
# LeetCode 181 – Employees Earning More Than Their Managers

## Problem

https://leetcode.com/problems/employees-earning-more-than-their-managers/

---

## Problem Summary

We are given a table:

### Employee

* id (Primary Key)
* name
* salary
* managerId

Task:
Return the names of employees whose salary is **higher than their manager’s salary**.

---

## Key Insight

We need to compare:

1. Each employee’s salary
2. Their manager’s salary
3. Both employee and manager are stored in the **same table**

So we use a **self join**.

---

## SQL Solution

```sql
SELECT e1.name AS Employee
FROM Employee e1
LEFT JOIN Employee e2
ON e1.ManagerId = e2.Id
WHERE e1.Salary > e2.Salary;
````

---

## Explanation

### Step 1: Treat the table as employees

```sql
FROM Employee e1
```

`e1` represents the employee.

---

### Step 2: Join the same table as managers

```sql
LEFT JOIN Employee e2
```

`e2` represents the manager.

This is called a **self join** because the table joins with itself.

---

### Step 3: Match each employee with their manager

```sql
ON e1.ManagerId = e2.Id
```

This connects:

* employee’s `ManagerId`
* manager’s `Id`

---

### Step 4: Compare employee salary and manager salary

```sql
WHERE e1.Salary > e2.Salary
```

Keeps only employees whose salary is greater than their manager’s salary.

---

### Step 5: Return employee name

```sql
SELECT e1.name AS Employee
```

Returns the employee name and labels the output column as `Employee`.

---

## Example

### Input:

| id | name  | salary | managerId |
| -: | ----- | -----: | --------: |
|  1 | Joe   |  70000 |         3 |
|  2 | Henry |  80000 |         4 |
|  3 | Sam   |  60000 |      NULL |
|  4 | Max   |  90000 |      NULL |

### Output:

| Employee |
| -------- |
| Joe      |

---

## Why Joe?

Joe’s salary is `70000`.

Joe’s manager is Sam, whose salary is `60000`.

Since:

```text
70000 > 60000
```

Joe is included in the result.

Henry’s salary is `80000`.

Henry’s manager is Max, whose salary is `90000`.

Since:

```text
80000 > 90000
```

Henry is not included.

---

## Alternative Solution

### Using INNER JOIN

```sql
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2
ON e1.ManagerId = e2.Id
WHERE e1.Salary > e2.Salary;
```

Since employees without managers cannot satisfy the salary comparison, `INNER JOIN` also works.

---

## Concepts Practiced

* SELECT
* WHERE
* JOIN
* LEFT JOIN
* Self Join
* Table Aliases
* Column Comparison

---

## Takeaway

When comparing rows inside the **same table**, use a **self join**.

For this problem:

* `e1` = employee
* `e2` = manager
* Compare `e1.Salary` with `e2.Salary`

---

## Tags

`SQL` `Self Join` `JOIN`  
```
```
