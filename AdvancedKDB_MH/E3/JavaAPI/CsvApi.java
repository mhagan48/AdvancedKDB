import kx.c;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.*;
import java.nio.file.*;

public class CsvApi {

	public static void main(String[] args){

		String filepath = "/home/mhagan_kx_com/E3/trade.csv";
        System.out.println("CSV Directory is: " + filepath);
        System.out.println("CONNECTING TO THE KDB TP PROCESS");
        int tpPort = 5020;
        System.out.println("TP Port is :"+ tpPort);
        c c=null;

        try{
	        c = new c("localhost",tpPort);
                System.out.println("Connected to TP successfully");

	        try{
		        BufferedReader br = Files.newBufferedReader(Paths.get(filepath));
		        String delimiter = ",";               
		        String line;
		        int i = 0;
		        while ((line = br.readLine()) != null) {
		                    
		            String rowValue[] = line.split(delimiter);
		            
		            String sym = rowValue[0];
		            double price = Double.parseDouble(rowValue[1]);
		            int size = Integer.parseInt(rowValue[2]);

		            Object[] tradeData = new Object[] {sym, price, size};
		            //Send row value over to the TP
		            c.ks(".u.upd", "trade", tradeData);
		            System.out.println("Row Sent");
		            i += 1;            
		        }
		        br.close();
		    } catch (IOException ex) {
		    	System.out.println("Error reading in CSV file...");
	        ex.printStackTrace();
	        } 
	    } catch (Exception e){
            System.out.println("Error connecting to the TP Process...");
            e.printStackTrace();
            System.exit(1);
        } finally {
            try{if(c!=null)c.close();}catch(java.io.IOException e){}
        }
    }               
}
