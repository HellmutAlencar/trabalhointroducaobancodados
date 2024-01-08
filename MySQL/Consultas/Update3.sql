SET profiling = 1;

UPDATE livros_emprestados
SET data_retornado = NULL
WHERE data_expedido BETWEEN '1990-01-01' AND '2000-01-01' AND isbn = '978-1-64427-768-3';

SHOW PROFILE