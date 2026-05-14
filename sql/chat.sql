-- 채팅 테이블 생성
create table chat
[
    -- 채팅 테이블 ID(기본키)
    chatId int primary key not null,
    -- 유저 ID(외래키 - USER 테이블 참조)
    foreign key (userId) references user(userId) not null,
    -- 상태 번호
    stateNum int not null,
    -- 내용
    chatContent varchar(500) not null,
    -- 입력 시간
    inputTime timestamp not null
]