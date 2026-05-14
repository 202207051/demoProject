-- 대결 참가자 테이블 생성
create table challengers
{
    -- 대결 참가자 테이블 ID(기본키)
    challengersId int primary key not null,
    -- 대결방 ID(외래키 - MATCHING_ROOM 테이블 참조)
    foreign key (roomId) references matching_room(roomId) not null,
    -- 상태
    state int not null,
    -- 승패 여부
    winOrLose bool not null,
    -- 제출 횟수
    submitCnt int not null
    }