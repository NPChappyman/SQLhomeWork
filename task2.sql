INSERT INTO area(area_name) VALUES
('Москва'),
('Санкт-Петербург'),
('Новосибирск'),
('Екатеринбург'),
('Нижний Новгород'),
('Казань'),
('Челябинск'),
('Самара'),
('Омск'),
('Ростов-на-Дону'),
('Уфа'),
('Красноярск'),
('Воронеж'),
('Пермь'),
('Волгоград'),
('Махачкала'),
('Грозный'),
('Владикавказ'),
('Ставрополь'),
('Назрань'),
('Хасавюрт'),
('Якутск'),
('Хабаровск'),
('Владивосток'),
('Иркутск'),
('Кемерово'),
('Благовещенск') ;


INSERT INTO specialization(specialization_name) VALUES
('Backend Developer - Python'),
('Backend Developer - Java'),
('Backend Developer - GO'),
('Frontend Developer'),
('Fullstack Developer'),
('Data Scientist'),
('Data Analyst'),
('QA Engineer'),
('DevOps Engineer'),
('System Administrator'),
('Маркетолог'),
('Менеджер по продажам'),
('HR-специалист'),
('Бухгалтер'),
('Юрист'),
('Логист'),
('Инженер-строитель'),
('Медицинская сестра'),
('Врач'),
('Учитель');

INSERT INTO employer (employer_name) VALUES
('Head Hunter'),
('Яндекс'),
('Касперский'),
('Сбер'),
('VK'),
('1С'),
('Ozon'),
('Тбанк'),
('Kontur'),
('Avito'),
('ООО рога и копыта');

INSERT INTO employee (employee_name)
SELECT
    'Employee_' || generate
FROM generate_series(1,100000) as generate;


WITH gen_vacancies AS (
    SELECT
        'Vacancy_' || generate AS vacancy_title,
        (trunc(random()*11)+1)::int AS employer_id,
        (trunc(random()*20) + 1)::int AS specialization_id,
        (20 + trunc(random() * 21))::int AS hours_per_week,
        (12000 + trunc(random() * 88001))::int AS compensation_from,
        (100000 + trunc(random() * 100001))::int AS compensation_to,
        (timestamp '2025-01-01' + (timestamp '2026-03-08' - timestamp '2025-01-01')*random()) as openned_at,
        (1 + trunc(random() * (SELECT max(area_id) FROM area)))::int AS area_id,
        'О вакансии: ' || substr(md5(random()::text),1,10) AS description


    FROM generate_series(1,10100) as generate
)
INSERT INTO vacancy (
    vacancy_title, employer_id, specialization_id,
    hours_per_week, compensation_from, compensation_to,
    openned_at,area_id, description
)
SELECT *
FROM gen_vacancies;


WITH random_resumes AS (
    SELECT

        (1 + trunc(random() * 100000))::int AS employee_id,
        md5(random()::text) AS title,
        (timestamp '2025-01-01' + (timestamp '2026-03-08' - timestamp '2025-01-01')*random()) as openned_at,
        md5(random()::text) AS first_name,
        md5(random()::text) AS last_name,
        '+7' || (900 + floor(random() * 100))::int ||
        lpad((floor(random() * 1000))::text, 3, '0') ||
        lpad((floor(random() * 100))::text, 2, '0') ||
        lpad((floor(random() * 100))::text, 2, '0') AS phone_number,
        (12000 + trunc(random() * 88001))::int AS compensation_from,
        (100000 + trunc(random() * 100001))::int AS compensation_to,
        (1 + trunc(random() * (SELECT max(area_id) FROM area)))::int AS area_id,
        (trunc(random()*20) + 1)::int AS specialization_id

    FROM generate_series(1,100000)
)
INSERT INTO resume (
    employee_id, title, created_at,first_name, last_name, phone_number,
    compensation_from, compensation_to, region_id, specialization_id
)
SELECT *
FROM random_resumes;


INSERT INTO response (vacancy_id, resume_id, created_at, description )
SELECT vac.vacancy_id, res.resume_id, GREATEST(vac.openned_at,res.created_at) +(random() * interval '30 days'),
        substr(md5(random()::text),1,10) AS description
FROM vacancy vac
JOIN resume res ON vac.specialization_id = res.specialization_id  ;







