SELECT vacancy_id, vacancy_title, COUNT(*) AS amount
FROM response
JOIN vacancy using(vacancy_id)
WHERE created_at between openned_at and (openned_at + interval '7 days')
group by vacancy_id, vacancy_title
HAVING count(resume_id)>5;
