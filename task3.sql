SELECT  area_id, area.area_name,
        round(avg(compensation_from),0) as average_compensation_from,
        round(avg(compensation_to),0) as average_compernsation_to,
        round(avg(
              COALESCE(
                    (compensation_from+compensation_to) / 2.0,
                    compensation_from,
                    compensation_to
              )
        ),0) as avg_compernsation

FROM vacancy
JOIN area using(area_id)
group by area_id, area.area_name
order by area_id;