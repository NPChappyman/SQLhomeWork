SELECT
    extract(MONTH from openned_at) as month,
    count(vacancy_id) as amount
FROM vacancy
GROUP BY extract(MONTH from openned_at)
ORDER BY amount DESC
LIMIT 1;


SELECT
    extract(MONTH from created_at) as month,
    count(resume_id) as amount
FROM resume
GROUP BY extract(MONTH from created_at)
ORDER BY amount DESC
LIMIT 1;