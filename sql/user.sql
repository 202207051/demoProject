-- 유저 테이블 생성
create table user
{
    -- 유저 테이블 ID
    userId int primary key not null,
    -- 닉네임
    name varchar(100) not null,
    -- 비밀번호
    password varchar(100) not null,
    -- 티어
    userRank varchar(100) not null,
    -- 대결 횟수
    matchSum int not null,
    -- 승리 횟수
    winCnt int not null,
    -- 패배 횟수
    loseCnt int not null,
    -- 프로필 이미지
    profileImage number not null,
    -- 자기소개서
    introduce varchar(100) not null
}