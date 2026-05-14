CREATE TABLE matching_room (
    matchingRoomId INT PRIMARY KEY NOT NULL,
    problemId INT NOT NULL,
    userId INT NOT NULL,
    state INT NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    timeLimit INT NOT NULL, 
    problemNum INT NOT NULL,
    winnerId INT DEFAULT NULL,
    loserId INT DEFAULT NULL,
    hint TEXT NOT NULL,
    FOREIGN KEY (problemId) REFERENCES problem(problemId),
    FOREIGN KEY (userId) REFERENCES user(userId)
);