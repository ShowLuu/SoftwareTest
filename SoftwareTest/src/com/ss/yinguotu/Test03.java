package com.ss.yinguotu;
import java.util.Scanner;

public class Test03 {
	
	public void test01(){
		int money,s;
		int c = 0;
		int p = 0;
		Scanner sc=new Scanner(System.in);
		System.out.print("请输入金额：");
		money=sc.nextInt();
		try {
			if(money>=10){
				int count=money/10;
				int l=money%10;
				for(int i=0;i<count;i++){
					System.out.print("请输入饮料种类0:退钱,1.橙汁;2.啤酒:");
					s=sc.nextInt();
					if(s==1){
						System.out.println("第"+(i+1)+"次购买"+"“橙汁” 饮料");
						c++;
						continue;
					}else if(s==2){
						System.out.println("第"+(i+1)+"次购买"+"“啤酒” 饮料");
						p++;
						continue;
					}else if(s==0){
						int result=i*10+l;
						System.out.println("共买了"+c+"瓶橙汁，"+p+"瓶啤酒，"+"即将找零"+result+"元");
						return;
					}else{
						System.out.println("输入有误，请重新选择！");
						i--;
						continue;
					}
				}
				System.out.println("共买了"+c+"瓶橙汁，"+p+"瓶啤酒，剩余不够10元，无法购买，即将找零"+l+"元");
			}else{
				System.out.println("投入小于10元，无法购买");
			}
		} catch (Exception e) {
			System.out.println("请输入整型数值！");
			this.test01();
		}

	}
	
	public void test02(){
		int x=21;
		int y=x/10;
		int z=x%10;
		System.out.println(y+"="+z);
	}

	public static void main(String[] args) {
		new Test03().test01();
	}
	
}
