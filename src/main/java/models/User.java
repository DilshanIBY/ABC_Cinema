// Placeholder content for User.java

public class user{
   string name,username,password,address,phone;
   int choice;
   Scanner sc = new Scanner(System.in);
   Showtime st = new Showtime();
   Booking b = new Booking();
   
   
   void buyTicket(){
   
   }
   void showTicket(){
   
   }
   void cancelTicket(){
   
   }
   void logout(){
   
   }
   
   public void userMenu(int userID){
     while(true){
     
        System.out.printIn(x:"------------User Menu-------------");
        System.out.printIn(x:"Press 1 to see all showtimes");
        System.out.printIn(x:"Press 2 to book a ticket");
        System.out.printIn(x:"Press 3 to see ticket bookings");
        System.out.printIn(x:"Press 4 to cancel ticket booking");
        System.out.printIn(x:"Press 5 to exit");
        System.out.printIn(x:"Enter your choice");
        choice = sc.nextInt();
        switch(choice){
            
            case 1:
                st.showShowtimes();
                break;
                
            case 2:
                b.BookTicket(userID);
                break;
                
            case 3:
                b.seeTicket(userID);
                break;
                
                
            case 4:
                b.cancelTicket(userID);
                break;
                
            case 5:
                System.exit(status:0);
                break;
                
            default:
                System.out.printIn(x:"Wrong choice entered! Retry");
                break;
        }
        
        
      }
   }
   
}