
### Crie o container (Só 1 vez)
```
docker compose build
```

### subir o servidor
```
docker compose up
```

### Executando o projeto
```
docker compose run app bash
```

### Criando o banco
```
bundle exec rails db:create
```

### Fazendo as migrações
```
bundle exec rails db:migrate
```

##### Rodar Seed
```
bundle exec rails db:seed
```
##### Abrir o terminal do Rails

```
bundle exec rails console
```

##### Possível erro de Gemfile

```
git config --global core.autocrlf false
git rm -rf --cached .
git reset --hard HEAD

```