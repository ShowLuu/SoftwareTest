package nc;

import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner a=new Scanner(System.in);
		System.out.println("请输入年份");
		int year=a.nextInt();
		System.out.println("请输入月份");
		int month=a.nextInt();
		System.out.println("请输入日期");
		int day=a.nextInt();
		int num=0;
		int total=0;int total1=0;int total2=0;
		
		for(int i=1;i<=year;i++){
			if((i%4==0)&&(i%100!=0)||(i%400==0))
			{
				num++;
			}
			total=num*366+(year-num-1)*365;
		}
		if((year%4==0)&&(year%100!=0)||(year%400==0)){
		//闰年情况
		switch(month)
		{	
			case 1:total2 = 0;break;
			case 2:total2 = 31;break;
			case 3:total2 = 60;break;
			case 4:total2 = 91;break;
			case 5:total2 = 121;break;
			case 6:total2 = 152;break;
			case 7:total2 = 182;break;
			case 8:total2 = 213;break;
			case 9:total2 = 244;break;
			case 10:total2 = 274;break;
			case 11:total2 = 305;break;
			case 12:total2 = 335;break;  
		}
		System.out.println("今年是闰年");
		}
		else{
		switch(month)
		{
			case 1:total2 = 0;break;
			case 2:total2 = 31;break;
			case 3:total2 = 59;break;
			case 4:total2 = 90;break;
			case 5:total2 = 120;break;
			case 6:total2 = 151;break;
			case 7:total2 = 181;break;
			case 8:total2 = 212;break;
			case 9:total2 = 243;break;
			case 10:total2 = 273;break;
			case 11:total2 = 304;break;
			case 12:total2 = 334;break; 
		}	
		System.out.println("今年是平年");
		}
		total1=total2+total+day;
		int b=total1%7;
		switch(b)
		{
		case 1:System.out.println("今天是星期一");break;
		case 2:System.out.println("今天是星期二");break;
		case 3:System.out.println("今天是星期三");break;
		case 4:System.out.println("今天是星期四");break;
		case 5:System.out.println("今天是星期五");break;
		case 6:System.out.println("今天是星期六");break;
		case 7:System.out.println("今天是星期日");break;
		
		
		}
		
	}

}
