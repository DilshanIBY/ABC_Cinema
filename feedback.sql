CREATE TABLE feedbacks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL
);


INSERT INTO feedbacks (userName, email, message)
VALUES
    ('John Doe', 'john.doe@example.com', 'Great service!'),
    ('Jane Smith', 'jane.smith@example.com', 'Had a wonderful experience!');
