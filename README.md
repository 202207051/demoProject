# demoProject
Built a web development and deployment system using Node.js for the backend, React for the frontend, and Rocky Linux with Docker containers.

## Project Structure

```text
Challengers-Project/
├── config/                         # DB 및 Redis 설정
│   ├── mariaDbConfig.js            # MariaDB 연결 설정
│   └── redisConfig.js              # Redis(분산 락 및 세션) 설정
├── controller/                     # 라우팅 및 비즈니스 로직 제어
│   ├── chatController.js           # 실시간 채팅 로직
│   ├── codeSubmissionController.js # 코드 빌드/제출 API
│   └── socketController.js         # WebSocket 실시간 알림 제어
├── dto/                            # 데이터 전송 객체
│   ├── chatRequestDto.js           # 채팅 데이터 형식
│   ├── codeRequestDto.js           # 빌드 요청 데이터 형식
│   └── compileResultDto.js         # 빌드 결과 응답 형식
├── exception/                      # 예외 처리
│   ├── customException.js          # 비즈니스 예외 처리기
│   ├── errorResponse.js            # 공통 에러 응답 객체
│   └── globalExceptionHandler.js   # 전역 예외 처리기
├── service/                        # 핵심 비즈니스 로직
│   ├── database/                   # DB 접근 및 레퍼지토리
│   │   ├── codeSubmission.js       # 코드 제출 비즈니스 로직
│   │   ├── databaseService.js      # DB 트랜잭션 관리
│   │   ├── user.js                 # 사용자 및 게임 결과 관리
│   │   └── repositories/           # SQL 쿼리문 실행 (USER, CHAT, PROBLEM 등)
│   ├── docker/                     # 도커 제어
│   │   ├── dockerService.js        # 컨테이너 생명 주기 관리
│   │   ├── containerConfig.js      # 컨테이너 보안 및 리소스 설정
│   │   └── docker_compose.yml      # 빌드/채점/게임방 컨테이너 정의
│   ├── judge/                      # 채점 로직
│   │   └── judge.js                # 관리자 기준 채점 엔진
│   ├── lock/                       # Redis 분산 락
│   │   └── redisLockService.js     # 공유 자원(파일/DB) 접근 제어
│   └── file/                       # 파일 시스템 입출력
│       ├── fileService.js          # 컨테이너 간 파일 입출력 공통 로직
│       ├── gameRoomFileService.js  # 게임방 내 코드 저장 관리
│       └── buildFileService.js     # 빌드 컨테이너 전달용 파일 관리
├── shared_volume/                  # 컨테이너 간 공유 볼륨 마운트 포인트
│   ├── code/                       # 사용자가 작성한 소스 코드 저장
│   └── result/                     # 컴파일 및 빌드 결과 로그 저장
├── sql/                            # 데이터베이스 스키마 관리
│   ├── user.sql                    # 소문자 변경
│   ├── matching_room.sql           # 소문자 변경
│   ├── challengers.sql             # 소문자 변경
│   ├── code_submit.sql             # 소문자 변경
│   └── grading_result.sql          # 소문자 변경
└── server.js                       # 메인 엔트리 포인트 (Express + Socket.io)
```
