# Wie komme ich an die Daten einer mongo-DB

Zuerst muss der Container gestarten werden. Danach wird mittels `docker exec ...` in den Container gewechselt. Um nun die MongoDB-Shell zu öffnen reicht es den Befehl `mongo` im Container auszuführen. Jetzt muss die `admin`-Datenbank ausgewählt werden und eine Authentifizierung mit einem privilegierten Benutzer durchgeführt werden.

```
use admin
db.auth("admin","admin");
```

Nach erfolgreicher Authentifizierung kann ein neuer Benutzer erstellt werden, der vollen Zugriff auf die Datenbank hat.

```
db.createUser({user: "myUserAdmin",pwd: "abc123",roles: [ { role: "root", db: "admin" } ]})
```

Für eine neue Datenbank kann der Container mit folgenden Environment-Variablen gestartet werden, um einen Admin-Benutzer mit Kennwort anzulegen.

```
MONGO_INITDB_ROOT_USERNAME: myUserAdmin
MONGO_INITDB_ROOT_PASSWORD: abc123
```

Um nun per Mongo-Db-Express auf die Daten zugreifen zu können müssen beim Container start die richtigen ENV-Variablen gesetzt sein:

**MONGO_INITDB_ROOT_USERNAME:** myUserAdmin
**MONGO_INITDB_ROOT_PASSWORD:** abc123
**ME_CONFIG_MONGODB_SERVER:** db
**ME_CONFIG_MONGODB_ADMINUSERNAME:** myUserAdmin
**ME_CONFIG_MONGODB_ADMINPASSWORD:** abc123

```
  mongo:
    image: mongo:3.2
    restart: always
    volumes:
      - data-volume:/data/db
    networks:
      - mongodb-net
      - projects
    environment:
      MONGO_INITDB_ROOT_USERNAME: myUserAdmin
      MONGO_INITDB_ROOT_PASSWORD: abc123

  mongo-express:
    image: mongo-express:0.44
    restart: always
    ports:
      - 8081:8081
    networks:
      - mongodb-net
      - projects
    environment:
      ME_CONFIG_MONGODB_SERVER: db
      ME_CONFIG_MONGODB_ADMINUSERNAME: myUserAdmin
      ME_CONFIG_MONGODB_ADMINPASSWORD: abc123

```

### Quellen
- [Dockerhub | mongo-express](https://hub.docker.com/_/mongo-express#configuration)
- [Dockerhub | mongo](https://hub.docker.com/_/mongo#environment-variables)
- [Shellhacks | Create user](https://www.shellhacks.com/mongodb-create-user-database-admin-root/)