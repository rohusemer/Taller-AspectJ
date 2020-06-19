import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {
	 	File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    
	    pointcut save1() : call(* *MakeTransaction( ));
	    after() : save1() {
	    	System.out.println("**** Transaction Successfully ****");
	    	String log = "Transaction at: " + cal.getTime().toString() + "\n";
	    	System.out.println(log);
	    	
	    	try(BufferedWriter outputStream =
	                 new BufferedWriter(new FileWriter("log.txt",true)))
	        {
	                outputStream.write(log);
	            
	        }
	        catch(FileNotFoundException e)
	        {
	            System.out.println("Error opening the file out.txt."+ e.getMessage());
	        }
	        catch(IOException e){
	            System.out.println("IOException."+ e.getMessage());
	        }
	    }
	    
	    pointcut save2(): call(* *Withdrawal());
	    after(): save2(){
	    	System.out.println("**** Transaction Successfully ****");
	    	String log = "Withdrawal at: " + cal.getTime().toString() + "\n";
	    	try(BufferedWriter outputStream =
	                 new BufferedWriter(new FileWriter("log.txt",true)))
	        {
                outputStream.write(log);
	        }
	        catch(FileNotFoundException e)
	        {
	            System.out.println("Error opening the file out.txt."+ e.getMessage());
	        }
	        catch(IOException e){
	            System.out.println("IOException."+ e.getMessage());
	        }
	    	
	    
	    }
	


}
