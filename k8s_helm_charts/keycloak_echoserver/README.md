# Application Tests

## First Step --> Get KeyCloak Auth Token

```sh
export TOKEN=$(curl -X POST 'https://keycloak.opsteamlab.net/auth/realms/local/protocol/openid-connect/token' \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -d "username=user1" \
 -d 'password=user1' \
 -d 'grant_type=password' \
 -d 'client_id=gatekeeper' \
 -d 'client_secret=OtJOikDcURaHuvosKTp03F9AhxpMljeU' | jq -r '.access_token')
```

## Second Step --> Application Auth

```sh
curl -L --request GET \
        --url "https://echoserver.opsteamlab.net" \
        -H "authorization: Bearer $TOKEN" #-H "X-ECHO-BODY: banana"
```
