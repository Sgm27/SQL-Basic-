SET @@auto_increment_increment = 5;
-- Thiết lập bước nhảy cho AUTO_INCREMENT

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    -- PRIMARY KEY phải là độc nhất không được trùng lặp dùng để nhận biết hàng này với hàng khác
    -- PRIMARY KEY không thể nhận giá trị NULL
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'Undeclared'
) AUTO_INCREMENT=100;
-- Khởi tạo giá trị đầu tiên cho AUTO_INCREMENT = 100
-- NOT NULL : Không thể được giá trị NULL
-- UNIQUE : Các giá trị phải độc lập với nhau 

DROP TABLE student;

INSERT INTO student (name, major) VALUES
('Jack', 'Biology'),
('Anna', 'Chemistry'),
('Tom', 'Physics'),
('Lucy', 'Mathematics'),
('John', 'Computer Science'),
('Emma', 'Biology'),
('Mike', 'Chemistry'),
('Sophia', 'Physics'),
('James', 'Mathematics'),
('Olivia', 'Computer Science'),
('Liam', 'Biology'),
('Mia', 'Chemistry'),
('Noah', 'Physics'),
('Ava', 'Mathematics'),
('Ethan', 'Computer Science'),
('Isabella', 'Biology'),
('Mason', 'Chemistry'),
('Ella', 'Physics'),
('Logan', 'Mathematics'),
('Chloe', 'Computer Science'),
('Lucas', 'Biology'),
('Grace', 'Chemistry'),
('Aiden', 'Physics'),
('Lily', 'Mathematics'),
('Alexander', 'Computer Science'),
('Zoe', 'Biology'),
('Michael', 'Chemistry'),
('Emily', 'Physics'),
('Daniel', 'Mathematics'),
('Samantha', 'Computer Science');

INSERT INTO student(name, major) VALUES('Duc Son', 'CNTT');
-- AUTO_INCREMENT sẽ được tính theo giá trị lớn nhất hiện tại của cột đó cộng thêm 1
SELECT * FROM student;

UPDATE student
SET major = 'Cong Nghe Thong Tin'
WHERE student_id = 251;

SELECT *
FROM student
ORDER BY name ASC, major DESC;
-- Sắp xếp theo tên tăng dần, nếu cũng tên thì sắp xếp theo ngành học giảm dần

SELECT *
FROM student 
LIMIT 10;
-- Hiển thị 10 người đầu tiên trong danh sách

SELECT *
FROM student 
WHERE name in ('Mike', 'Anna', 'Duc Son');
-- in : nằm trong một danh sách nào đó 

SHOW TABLES;
