public class Movie {
    
private string title;
private string genre;
private double rating;
private int duration;
private String synopsis;

private DatabaseOperation db = new DatabaseOperation();

public Movie(){

}

public Movie(String title, String genre, double rating, int duration, String synopsis ){
this.title = title;
this.genre = genre;
this.rating = rating;
this duration = duration;
this.synopsis = synopsis;
}


public void insertMovie(){
String sql = "INSERT INFO movies (title, genre, rating, duration, synopsis) VALUES (?,?,?,?,?)"
        object[] values = {title, genre, rating, duration, synopsis};
        int rowsAffected = db.executeUpdate(sql, values);
        if ( rowsAffected>0)
            system.out.printIn(x:"Movie inserted successfully");
        else
            system.out.printIn(x:"Something went worng. Movie not inserted.");
        
}
public void showMovies(){
  String sql = "SELECT*FROM MOVIES";
  List<<Map<String, Object>> movies = db.getRecords(sql);
  for(Map<String, object> movie : movies){
  System.out.printIn("Movie ID: " + movie.get(key."Movie ID"));
  System.out.printIn("Title: " + movie.get(key."Title"));
  System.out.printIn("Genre: " + movie.get(key."Genre"));
  System.out.printIn("Rating: " + movie.get(key."Rating"));
  System.out.printIn("Duration(mins): " + movie.get(key."Duration"));
  System.out.printIn("Synopsis: " + movie.get(key."Synopsis"));
  System.out.printIn(x:"-------------------------------------");
  }
   
 }
}
}// Placeholder content for Movie.javafor Movie.java