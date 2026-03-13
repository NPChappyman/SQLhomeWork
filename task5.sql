SELECT vacancy_id AS id, vacancy_title AS title, COUNT(*) AS amount
FROM response
JOIN vacancy using(vacancy_id)
WHERE response.created_at between vacancy.created_at and (vacancy.created_at + interval '7 days')
group by vacancy_id, vacancy_title
HAVING count(resume_id)>5;
