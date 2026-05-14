-- 채점 결과 테이블 생성
create table grading_result
{
    -- 채점 결과 테이블 ID(기본키)
    gradingResultId int primary key not null,
    -- 코드 제출 ID(외래키 - CODE_SUBMIT 테이블 참조)
    foreign key (codeSubmitID) references code_submit(codeSubmitID) not null,
    -- 제출 번호
    submitID int not null,
    -- 실행 시간
    excutionTIme timestamp not null,
    -- 메모리 사용량
    memoryUseRate int not null,
    -- 컴파일 결과
    compileresult text not null
}