require_relative "./_configure"

DB.define_table("users")
DB.define_column("users", "name", "string")
DB.define_column("users", "email", "string")
DB.define_column("users", "password", "string")

DB.define_table("movies")
DB.define_column("movies", "title", "string")
DB.define_column("movies", "director", "string")
DB.define_column("movies", "image", "string")
DB.define_column("movies", "critic_rating", "integer")

DB.define_table("results")
DB.define_column("results", "movie_id", "integer")
DB.define_column("results", "user_id", "integer")
DB.define_column("results", "q1", "boolean")
DB.define_column("results", "q2", "boolean")
DB.define_column("results", "q3", "boolean")