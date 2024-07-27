# Mermaid ER Diagram

    User {
        int id PK
        string Username
        string Firstname
        string Lastname
        string Email
        string Password
    }

    File {
        int id PK
        string Filename
        string MIMEType
        string Keyfile
        string FileURL
        int user_id FK
    }

    Movie {
        int id PK
        string Title
        string Description
        decimal Budget
        date Release_date
        int Duration
        string Poster
    }

    Director {
        int id_director PK
        string Firstname
        string Lastname
        int movie_id FK
    }

    Country {
        int id_country PK
        string Country_name 
        int movie_id FK
    }

    Genres {
        int id PK
        string Genre_name
    }

    Movie_Genres {
        int id
        int Movie_id FK
        int Genre_id FK
    }

    Character {
        int id PK
        string Name
        text Description
        string Role
    }

    Actor {
        int id PK
        string Firstname
        string Lastname
    }

    MovieCharacter {
        int id PK
        int Movie_id FK
        int Character_id FK
    }

    CharacterActor {
        int id PK
        int Character_id FK
        int Actor_id FK
    }

    Person {
        int actor_id PK, FK
        text Biography
        date Date_of_birth
        string Gender
        string Home_country
        string main_image
    }

    PersonImages {
        int image_id PK
        int person_id FK
        string image_url
    }

    FavoriteMovies {
        int user_id PK, FK
        int movie_id PK, FK
    }

   
    User ||--o{ File : "has"
    Movie ||--o{ Director : "has"
    Movie ||--o{ Country : "has"
    Movie ||--o{ Movie_Genres : "has"
    Genres ||--o{ Movie_Genres : "categorized by"
    Movie ||--o{ MovieCharacter : "has"
    Character ||--o{ MovieCharacter : "features"
    Character ||--o{ CharacterActor : "played by"
    Actor ||--o{ CharacterActor : "plays"
    Actor ||--|{ Person : "is"
    Person ||--o{ PersonImages : "has"
    User ||--o{ FavoriteMovies : "favorites"
    Movie ||--o{ FavoriteMovies : "favorited by"


## Mermaid ER diagram
![Mermaid](/Mermaid%20ER%20diagram.png)
