CREATE TABLE challengers (
    challengersId INT PRIMARY KEY NOT NULL,
    roomId INT NOT NULL,
    state INT NOT NULL,
    winOrLose BOOL NOT NULL,
    submitCnt INT NOT NULL,
    FOREIGN KEY (roomId) REFERENCES matching_room(matchingRoomId)
);