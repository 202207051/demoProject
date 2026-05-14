-- 문제 테이블 생성
create table problem
{
    -- 문제 테이블 ID
    problemId int primary key not null,
    -- 제목
    title varchar(1000) not null,
    -- 설명
    explanation text not null,
    -- 난이도
    level int not null,
    -- 시간 제한
    timeLimit timestamp not null,
    -- 메모리 제한
    memoryLimit int not null
}