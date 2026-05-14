CREATE TABLE grading_result (
    gradingResultId INT PRIMARY KEY NOT NULL,
    codeSubmitId INT NOT NULL,
    submitID INT NOT NULL,
    executionTime INT NOT NULL, 
    memoryUseRate INT NOT NULL,
    compileResult TEXT NOT NULL,
    FOREIGN KEY (codeSubmitId) REFERENCES code_submit(codeSubmitId)
);