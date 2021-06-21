# hamonikr-guest-sseion

하모니카OS에서 guest session 을 사용하는 경우에 필요한 설정을 제공하는 패키지입니다.

 - 게스트 사용자의 2G 용량 제한을 해제
 - guest session 시작 시 보이는 경고창 제거
 - guest session 을 그룹으로 관리할 수 있는 설정 추가
 - 게스트 사용자의 디스크 용량 제한(Quota) 적용

# Usage

게스트 사용자의 디스크 용량 제한(Quota) 적용하기 위해 다음과 같이 실행하세요. 

1) `/usr/bin/set_quota.sh` 파일에서 용량을 제한하고 싶은 크기를 수정합니다.
```
sudo vi /usr/bin/set_quota.sh

# 10GB quota 를 설정하고 싶은 경우에는 아래와 같이 수정
QTSIZE="10" 
```

2) sudo 권한으로 `/usr/bin/set_quota.sh` 실행합니다.
```
sudo /usr/bin/set_quota.sh
```

3) 설정이 적용될 수 있도록 시스템을 `재시작` 합니다.