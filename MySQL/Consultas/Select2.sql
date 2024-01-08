SET profiling = 1;

SELECT *
FROM livros_emprestados
WHERE data_expedido BETWEEN '1990-01-01' AND '2000-01-01' AND MONTH(data_expedido) = 05;

SHOW PROFILE