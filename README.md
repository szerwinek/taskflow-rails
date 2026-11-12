# TaskFlow — system zarządzania projektami i zadaniami

Aplikacja studencka Ruby on Rails + PostgreSQL. Umożliwia rejestrację i logowanie,
zarządzanie projektami oraz zadaniami (CRUD), a także osobisty panel użytkownika.

## Wymagania
- Ruby 3.2+
- Rails 8.0.x
- PostgreSQL 14+
- Node.js nie jest wymagany do podstawowego uruchomienia (Importmap)

## Uruchomienie

1. Zainstaluj zależności:
   ```bash
   bundle install
   ```
2. Utwórz bazę danych. Domyślna konfiguracja używa lokalnego PostgreSQL:
   ```bash
   bin/rails db:prepare
   ```
   Jeśli lokalny użytkownik PostgreSQL wymaga hasła, ustaw `DATABASE_URL`, np.:
   ```bash
   export DATABASE_URL="postgresql://postgres:haslo@localhost:5432/task_manager_rails_development"
   ```
3. Uruchom serwer:
   ```bash
   bin/rails server
   ```
4. Otwórz http://localhost:3000.

## Najważniejsze funkcje
- rejestracja, logowanie i wylogowanie (sesja oparta o `has_secure_password`);
- panel użytkownika z podsumowaniem projektów i zadań;
- CRUD projektów;
- CRUD zadań przypisanych do projektów;
- statusy zadań: do zrobienia, w toku, ukończone;
- walidacje modeli i ograniczenia dostępu — użytkownik widzi wyłącznie swoje dane;
- responsywny interfejs bez zewnętrznego frameworka CSS.

## Pierwsze uruchomienie — konto
Wejdź na `/signup`, utwórz konto i zaloguj się. Nie ma domyślnego konta administratora.

## Struktura
- `app/models` — modele `User`, `Project`, `Task`;
- `app/controllers` — logika HTTP i autoryzacja;
- `app/views` — widoki ERB;
- `config/routes.rb` — trasy;
- `db/migrate` — migracje PostgreSQL.

## Testy
```bash
bin/rails db:test:prepare
bin/rails test
```

## Uwaga wdrożeniowa
To projekt edukacyjny. Przed wdrożeniem publicznym skonfiguruj HTTPS, silne sekrety,
kopie zapasowe PostgreSQL, limitowanie prób logowania, politykę haseł i monitoring.
