package com.ss.yinguotu;

import java.io.IOException;
import java.util.Scanner;


public class Test02{
	
	public void test01(){
		int age;
		char sex;
		String str1;
		int str2;
		Scanner keyboard=new Scanner(System.in);
		System.out.println("please input sex:");	
		str1=keyboard.next();
	    sex=str1.charAt(0);
		if(sex!='G'){
			System.out.println("�Ա𲻷���Ҫ��");
			return;
		}
		System.out.println("please input age:");
		try {
			str2=keyboard.nextInt();
			if(str2<18||str2>22){
				System.out.println("����ѡ�����䷶Χ֮��");
				return;
			}else{
				System.out.println("ѡ�γɹ�");
			}
		} catch (Exception e) {
			System.out.println("���벻�Ϸ�������������");
			this.test01();
		}
	}
	
	

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		new Test02().test01();
	}

}
