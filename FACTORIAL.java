import java.util.Scanner;
public class FACTORIAL
{
    public static void main(String [] args)
    {
        Scanner sc = new Scanner(System.in);
        System.out.print("How many numbers do you need factorial for : ");
        int N =sc.nextInt();
        

        for(int j =1; j<=N; j++)
        {
            int F =1;
            System.out.print("for which number do you need factorial : ");
            int a =sc.nextInt();
            for(int i =1; i<=a; i++)
            {
                F =F*i;
            }
            System.out.println("factorial of "+a+" : "+F);
        }
        
    }
}