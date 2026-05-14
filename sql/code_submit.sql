-- 코드 제출 테이블 생성
create table code_submit
{
    -- 코드 제출 테이블 ID(기본키)
    codeSubmitId int primary key not null,
    -- 유저 ID(외래키 - USER 테이블 참조)
    foreign key (userID) references user(userId) not null,
    -- 대결참가자 ID
    challengersId int not null,
    -- 문제 번호
    problemNum int not null,
    -- 언어
    language varchar(50) not null,
    -- 소스 코드
    sourceCode text not null,   
    -- 제출 시간
    submitTime timestamp not null,
    -- 제출 상태
    submitState int not null
}