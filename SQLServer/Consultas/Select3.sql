SET STATISTICS TIME ON;

SELECT le.*, l.titulo_livro
FROM dbo.livros_emprestados le
JOIN livros l
   ON le.isbn = l.isbn
WHERE data_expedido BETWEEN '1990-01-01' AND '2000-01-01' AND MONTH(data_expedido) = 05 AND l.titulo_livro LIKE '%simplicidade%'

SET STATISTICS TIME OFF;
GO