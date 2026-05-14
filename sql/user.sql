CREATE TABLE user (
    userId INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    userRank VARCHAR(100) NOT NULL,
    matchSum INT NOT NULL DEFAULT 0,
    winCnt INT NOT NULL DEFAULT 0,
    loseCnt INT NOT NULL DEFAULT 0,
    profileImage INT NOT NULL, 
    introduce VARCHAR(100) NOT NULL
);