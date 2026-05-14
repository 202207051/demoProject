-- 대결방 테이블 생성
create table matching_room
{
    -- 대결방 테이블 ID(기본키)
    matchingRoomId int primary key not null,
    -- 문제 ID(외래키 - PROBLEM 테이블 참조)
    foreign key (problemId) references problem (problemId) not null,
    -- 유저 ID(외래키 - USER 테이블 참조)
    foreign key (userId) references user (userId) not null,
    -- 상태
    state int not null,
    -- 시작 시간        
    startTime timestamp not null,  
    -- 종료 시간
    endTime timestamp not null,
    -- 제한 시간
    timeLimit int timestamp not null,
    -- 문제 번호
    problemNum int not null,
    -- 승/패자 번호
    winerID/loserID int not null,
    -- 힌트
    hint text not null
}