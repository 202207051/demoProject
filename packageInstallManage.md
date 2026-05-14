# packageInstallManage

## SSH 패키지 설치

- SSH 서버 패키지 설치

```bash
sudo dnf install -y openssh-server
```

- SSH 서비스 활성화 및 시작

```bash
sudo systemctl enable --now sshd
```

- 방화벽 설정 - SSH 서비스 허용 및 재시작

```bash
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
```

- SSH 서비스 동작 상태 최종 확인

```bash
sudo systemctl status sshd
```

- 서버 IP 주소 확인

```bash
ip addr show | grep -E "inet.*ens"
```

## dnf 최적화

- 병렬 다운로드 개수 설정

```bash
sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
```

- 가장 빠른 미러 사이트 사용 설정

```bash
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
```

- 설정 결과 최종 확인

```bash
cat /etc/dnf/dnf.conf | grep -E "max_parallel|fastestmirror"
```

## 시스템 업데이트 및 필수 도구 설치

- 모든 패키지를 최신 버전으로 업데이트

```bash
sudo dnf -y update
```

- 필수 유틸리티 및 개발 환경 설치

```bash
sudo dnf -y install vim wget curl git net-tools nodejs npm
```

## 파이썬 패키지 설치

- 파이썬 빌드 필수 의존성 패키지 설치

```bash
sudo dnf -y install python3-pip python3-devel gcc make zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils
```

- pyenv 설치 및 환경 변수 등록

```bash
curl https://pyenv.run | bash
echo -e '\n# pyenv settings' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

- poetry 설치 및 경로 등록

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

- 설정 적용

```bash
source ~/.bashrc
```

## 자바 패키지 설치

- openJDK 21 설치 및 확인

```bash
sudo dnf -y install java-21-openjdk-devel
java -version
```

- SDKMAN! 설치

```bash
sudo dnf install -y tar unzip zip curl
curl -s "https://get.sdkman.io" | bash
```

- SDKMAN! 설정 적용

```bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

- gradle 설치

```bash
sdk install gradle
```

## C/C++ 패키지 설치

- 개발 도구 그룹 설치

```bash
sudo dnf -y groupinstall "Development Tools"
```

- 최신 cmake 설치

```bash
sudo dnf -y install cmake
```

## node 패키지 설치

- nvm 다운로드 및 설치

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

- node.js 다운로드 및 설치

```bash
nvm install 24
```

- node.js 버전 확인

```bash
node -v
nvm current
npm -v
```

## redis 패키지 설치

- yum을 사용하여 epel 설치

```bash
sudo yum install epel-release
```

- epel 설치가 완료되면, yum을 사용하여 redis 설치

```bash
sudo yum install redis -y
```

- redis 서비스 시작

```bash
sudo systemctl start redis.service
```

- 서버 시작 시 redis 자동 시작

```bash
sudo systemctl enable redis
```

- redis의 상태 확인 및 설정 테스트

```bash
redis-cli ping
```

## redis 보안 관련 설정

- redis 구성 편집 실행

```bash
sudo vi /etc/redis.conf
```

- bind 시작하는 줄을 찾고 주석 처리되지 않았는지 확인

```text
bind 127.0.0.1 --> bind 0.0.0.0
```

- redis 방화벽 정책에 전용 redis 영역 추가

```bash
sudo firewall-cmd --permanent --new-zone=redis
```

- redis 포트 설정(6379포트 사용)

```bash
sudo firewall-cmd --permanent --zone=redis --add-port=6379/tcp
```

- redis에 액세스할 수 있는 사설 IP 주소 지정

```bash
sudo firewall-cmd --permanent --zone=redis --add-source=client_server_private_IP
```

- 방화벽 새 규칙 적용

```bash
sudo firewall-cmd --reload
```

- redis 보조 호스트 액세스 권한 부여

```bash
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp -s client_servers_private_IP/32 --dport 6379 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -P INPUT DROP
```

## redis 암호 구성

- redis 구성 편집 실행

```bash
sudo vi /etc/redis.conf
```

- “보안” 섹션을 찾아, 주석이 있는 지점 찾기(# 주석 처리 해제)

```text
# requirepass fobared --> requirepass fobared
```

- redis 보안 규정으로 암호 매번 바뀜 --> 동일한 비번 생성하는 설정

```bash
echo "digital-ocean" | sha1sum
```

- requirepass의 새 값을 복사/붙여넣기

```text
requirepass password_copied_from_output
```

- redis 다시 시작

```bash
sudo systemctl restart redis.service
```

- 유효한 암호인지 테스트

```bash
redis-cli
set key1 10
auth your_redis_password
set key1 10
get key1
quit
```

## NOAUTH 인증

- redis 그룹 권한 확인

```bash
ls -l /var/lib | grep redis
```

- redis 그룹 권한 변경

```bash
sudo chmod 770 /var/lib/redis
```

- redis 구성 파일 권한 확인

```bash
ls -l /etc/redis.conf
```

- redis 구성 파일 권한 변경

```bash
sudo chown redis:redis /etc/redis.conf
sudo chmod 600 /etc/redis.conf
```

- 새 소유권 및 권한 확인

```bash
ls -l /etc/redis.conf
```

- redis 다시 시작

```bash
sudo systemctl restart redis.service
```

## 도커 패키지 설치

- 저장소 관리를 위한 플러그인 설치

```bash
sudo dnf -y install dnf-plugins-core
```

- 도커 공식 저장소 추가

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

- 도커 엔진 및 플러그인 설치

```bash
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- 도커 서비스 시작 및 활성화

```bash
sudo systemctl enable --now docker
```

- 현재 사용자를 docker 그룹에 추가

```bash
sudo usermod -aG docker $USER
```

- 그룹 변경 사항 즉시 적용

```bash
newgrp docker
```

## MariaDB 패키지 설치

- MariaDB 설치

```bash
sudo dnf -y install mariadb-server mariadb
```

- MariaDB 서비스 활성화 및 시작

```bash
sudo systemctl enable --now mariadb
```

- 보안 설정 마법사 실행

```bash
sudo mariadb-secure-installation
```

- 방화벽 설정

```bash
sudo firewall-cmd --permanent --add-service=mysql
sudo firewall-cmd --reload
```

## dnf 유지보수

- 미사용 의존성 자동 삭제

```bash
sudo dnf autoremove -y
```

- 캐시 데이터 삭제

```bash
sudo dnf clean all
```

- 중복 패키지 확인 및 제거

```bash
sudo dnf remove --duplicates
```

- 의존성 문제 해결 및 배포판 동기화

```bash
sudo dnf distro-sync -y
```
