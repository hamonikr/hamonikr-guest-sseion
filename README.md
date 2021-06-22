# hamonikr-guest-sseion

하모니카OS에서 guest session 을 사용하는 경우에 필요한 설정을 제공하는 패키지입니다.

 - 게스트 사용자의 2G 용량 제한을 해제
 - guest session 시작 시 보이는 경고창 제거
 - guest session 을 그룹으로 관리할 수 있는 설정 추가
 - 게스트 사용자의 디스크 용량 제한(Quota) 적용

# Usage

게스트 사용자의 디스크 용량 제한(Quota) 적용하기 위해 다음과 같이 실행하세요. 

1) sudo 권한으로 `/usr/bin/set_quota.sh` 실행합니다.
```
# 쿼터를 설정하고 싶은 GB 단위로 파라미터를 입력
# 10G 용량제한을 하고 싶은 경우 아래와 같이 실행

sudo /usr/bin/set_quota.sh 10
```

2) 설정이 적용될 수 있도록 시스템을 `재시작` 합니다.