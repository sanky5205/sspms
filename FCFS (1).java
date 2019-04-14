import java.util.Scanner;

class Process{
    int wait;
    int arrival;        //arrival time
    int bursts;
	int turnAround;
	int completionTime = 0;
    Process(int arr,int bur){
        arrival = arr;
        bursts = bur;
    }

}
class FCFS{
    public static void main(String[] args){
        int x=0;
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the number of processes:");
		int n = s.nextInt();
        Process[] myProcess = new Process[n];
		for(int i=0;i<n;i++){
			System.out.println("Enter Arrival time and bursts: ");
			int arr  = s.nextInt();
			int bur = s.nextInt();
			myProcess[i] = new Process(arr,bur);
		}
		
		  System.out.println("\n============================");
        for(int i=0;i<myProcess.length;i++){
            x = x+myProcess[i].bursts;
			myProcess[i].completionTime = x;
			myProcess[i].turnAround = myProcess[i].completionTime - myProcess[i].arrival;  //TAT=CT-AT
			myProcess[i].wait = myProcess[i].turnAround - myProcess[i].bursts;            //WT=TAT-BT
			System.out.println("Process "+i+":");
			System.out.println("Turnaround\tCompletion\twaiting");
			System.out.println(myProcess[i].turnAround+"\t\t\t"+myProcess[i].completionTime+"\t\t\t"+myProcess[i].wait);
        }
        
        //calculating avg
        int avgTAT=0,avgWT=0;
        for(int i=0;i<myProcess.length;i++) {
        	avgTAT+=myProcess[i].turnAround;
        	avgWT+=myProcess[i].wait;
        }
        
        System.out.println("Average Turnaround Time: "+avgTAT/(float)myProcess.length);
        System.out.println("Average Waiting Time: "+avgWT/(float)myProcess.length);
    }
}