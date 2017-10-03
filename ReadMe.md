The following .sql files contain the answers to the questions of the SQLZOO's MySQL Tutorial (http://sqlzoo.net/).
Apart from the answers of the tutorials there are also the answers of the quizzes (in .txt format). It would be
better for someone to attempt the quizzes by himself/herself and then check with the solutions. The same strategy
should be followed with the tutorials' questions.

In joining tables, I used the method of matching the Primary Keys (PK) with the Foreign Keys (FK) of the desired
tables in the 'WHERE' section, rather than using the JOIN ON function in the 'FROM' section [this was only applied
in INNER JOINS].

I did these SQL queries during my preperation for an introductory undergraduate course in 'Design and Use of
Databases'. This series of tutorials provide a solid background in SQL so I found it a good starting point for
experimentation and learning the basic SQL functions. However there are other, even more complicated concepts that
you might experience in MySQL (more complicated multiple table join, complex nested queries etc.), which you can
dive into after finishing this tutorial.

If someone is interested in learning more about SQL and Databases (DBs) in general, a good recommendation is
'Fundamentals Of Database Systems' by Ramez Elmasri and Shamkant B. Navathe, which I found easy-to-read, very
explanatory, detailed and with numerous examples.

If you would like to use some advice, from what our professor tought us, the best way to write SQL queries is to
start from the 'FROM' section, including all the tables that contain the fields you will need and creating the
cartesian product. Then proceed with the 'WHERE' section (in rare cases might not be included in the query), join
the tables (if needed) and check for conditions, limitations etc. Go on with the 'ORDER BY', 'GROUP BY' and
'HAVING' sections and finally you can choose the fields or characteristics you want as an answer in the 'SELECT'
section.

Note: Should you find any mistake please do not hesitate to contact me.