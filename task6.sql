

CREATE INDEX vacancy_area_id_index on vacancy (area_id); --Ускоряет поиск(группировку и join) работ по городу

CREATE INDEX vacancy_employer_id_index ON vacancy(employer_id); -- Ускорит поиск работ по id компании

--Для employee, было бы очень хорошо ускорить поиск по специальности, поэтому необходимо
CREATE INDEX vacancy_specialization_id_index ON vacancy(specialization_id);

--То же самое для employer
CREATE INDEX resume_specialization_id_index ON resume(specialization_id);

--Для того, что искать отклики на конкретную вакансию
CREATE INDEX response_vacancy_index ON response(vacancy_id);

--Если employee хочет получить вакансии с зарплатой в диапозоне (compensation_from, compensation_to)
CREATE INDEX vacancy_compensation_from_to_index ON vacancy(compensation_from, compensation_to);


