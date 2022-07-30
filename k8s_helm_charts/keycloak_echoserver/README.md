# Application Tests

## First Step --> Get KeyCloak Auth Token

```sh
export TOKEN=$(curl -X POST 'http://keycloak.opsteamlab.net/auth/realms/local/protocol/openid-connect/token' \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=bruno" \
 -d 'password=bruno123' \
 -d 'grant_type=password' \
 -d 'client_id=gatekeeper' \
 -d 'client_secret=GnovbKiHYMPOFATWpbkjTuPhPTVofX3d' | jq -r '.access_token')
```

## Second Step --> Application Auth

```sh
curl -L --request GET \
        --url "echoserver.opsteamlab.net" \
        -H "authorization: Bearer $TOKEN" #-H "X-ECHO-BODY: banana"
```
