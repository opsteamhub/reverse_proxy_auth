# Keyclock installation

## Helm installation

Just execute inside a k8s cluster:

```sh
./install_keycloak.sh
```

## Helm installation with External database

Edit the values_external_db.yaml pointing to the right External Database(postgres) and run:

```sh
./install_keycloak_external_database.sh
```

## How to test locally

To try Keycloak out, just execute:

```sh
docker-compose -f keycloak-postgres.yml up -d
```

To delete all the create resources, just execute:

```sh
docker-compose -f keycloak-postgres.yml down
docker volume rm -f keycloak_auth_postgres_data
```
