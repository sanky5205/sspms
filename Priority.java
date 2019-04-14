import java.util.Scanner;

class Process{
	    int wait;
	    int bursts;
		int turnAround;
		int priority;
		int process;        //process no
	    Process(int no,int bur,int prio){
	        process=no;
	    	bursts = bur;
	        priority=prio;
	    }
}

class Priority {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x=0;
		Scanner s = new Scanner(System.in);
		System.out.println("Enter the number of processes:");
		int n = s.nextInt();
	    Process[] myProcess = new Process[n];
	    Process temp;
	    for(int i=0;i<n;i++){
			System.out.println("Enter bursts priority: ");
			int bur = s.nextInt();
			int prio= s.nextInt();
			myProcess[i] = new Process(i,bur,prio);
		}
	    
	    //Sorting
	    for(int i=0;i<n-1;i++)
	    {
	      for(int j=i+1;j<n;j++)
	      {
	    	  if(myProcess[i].priority<myProcess[j].priority) {
	    	  temp=myProcess[i];
	    	  myProcess[i]=myProcess[j];
	    	  myProcess[j]=temp;
	    	  }
	      }
	    }
	    System.out.println("\n============================");
	    for(int i=0;i<myProcess.length;i++){
            x = x+myProcess[i].bursts;
			myProcess[i].turnAround = x;                     
			myProcess[i].wait = myProcess[i].turnAround - myProcess[i].bursts;      //WT=TAT-BT
			System.out.println("Process "+myProcess[i].process);
			System.out.println("Turnaround\tWaiting\tPriority");
			System.out.println(myProcess[i].turnAround+"\t\t\t"+myProcess[i].wait+"\t\t\t"+myProcess[i].priority);
        }
	    
	    //calculating avg
        int avgTAT=0,avgWT=0;
        for(int i=0;i<myProcess.length;i++) {
        	avgTAT+=myProcess[i].turnAround;
        	avgWT+=myProcess[i].wait;
        }
        
        System.out.println("Average Turnaround Time: "+avgTAT/(float)myProcess.length);
        System.out.println("Average Turnaround Time: "+avgWT/(float)myProcess.length);
    
	}
}	
	

	
	    
	    

