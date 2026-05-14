CREATE TABLE problem (
    problemId INT PRIMARY KEY NOT NULL,
    title VARCHAR(1000) NOT NULL,
    explanation TEXT NOT NULL,
    level INT NOT NULL,
    timeLimit INT NOT NULL, 
    memoryLimit INT NOT NULL
);