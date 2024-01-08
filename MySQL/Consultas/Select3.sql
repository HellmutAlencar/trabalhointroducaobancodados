SET profiling = 1;

SELECT le.*, l.titulo_livro
FROM livros_emprestados le
JOIN livros l
   ON le.isbn = l.isbn
WHERE data_expedido BETWEEN '1990-01-01' AND '2000-01-01' AND MONTH(data_expedido) = 05 AND l.titulo_livro REGEXP 'simplicidade';

SHOW PROFILE