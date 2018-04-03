package com.ss.yinguotu;

import java.util.Arrays;
import java.util.Scanner;

public class Test01 {
	
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

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double a,b,c;
		Scanner keyboard=new Scanner(System.in);    //输入三角形三条边
	     System.out.print("please input a=");
		a=keyboard.nextDouble();
		System.out.print("please input b=");
		b=keyboard.nextDouble();
		System.out.print("please input c=");
		c=keyboard.nextDouble();
       
	}
}

