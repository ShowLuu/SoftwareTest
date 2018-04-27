package test;

import java.util.Arrays;
import java.util.Scanner;

public class Test02 {
	
	public void sanjiaoxing(){
		try {
			Scanner s=new Scanner(System.in);
			System.out.print("请输入第一条边：");
			double s1=s.nextDouble();
			System.out.print("请输入第二条边：");
			double s2=s.nextDouble();
			System.out.print("请输入第三条边：");
			double s3=s.nextDouble();
			System.out.println("三边分别为："+s1+"="+s2+"="+s3);
		} catch (Exception e) {
			System.out.println("请输入数值！");
			new Test02().sanjiaoxing();
		}
	}
	
	public void test01(){
		double a,b,c;
		Scanner keyboard=new Scanner(System.in);    //输入三角形三条边
	     System.out.print("please input a=");
		a=keyboard.nextDouble();
		System.out.print("please input b=");
		b=keyboard.nextDouble();
		System.out.print("please input c=");
		c=keyboard.nextDouble();
		double[] abc={a,b,c};
		if(a!=0&&b!=0&&c!=0){
			Arrays.sort(abc);
			System.out.println(abc[0]+"="+abc[1]+"="+abc[2]);
			double s1=abc[0];
			double s2=abc[1];
			double s3=abc[2];
			if((s1+s2)>s3){
				System.out.println("符合一般三角形");
				if((s1==s2)||(s2==s3)){
					System.out.println("符合等腰三角形");
				}
				if(s1==s2&&s2==s3){
					System.out.println("符合等边三角形");
				}
			}else{
				System.out.println("不符合一般三角形");
			}
		}else{
			System.out.println("不符合三角形");
		}
	}
	
	public static void main(String[] args) {
		new Test02().test01();
	}

}
