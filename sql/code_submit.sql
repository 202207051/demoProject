CREATE TABLE code_submit (
    codeSubmitId INT PRIMARY KEY NOT NULL,
    userId INT NOT NULL,
    challengersId INT NOT NULL,
    problemNum INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    sourceCode TEXT NOT NULL,
    submitTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    submitState INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(userId)
);