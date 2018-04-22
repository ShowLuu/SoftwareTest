package university;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Test06 {
	
	private List<Double> score;
	private Double[] ds=new Double[50];
	
	public List<Double> getList(){
		if(score==null){
			score=new ArrayList<>();
		}
		Scanner s=new Scanner(System.in);
		try {
			double rs; 
			for(int i=0;i<50;i++){
				System.out.println("请输入成绩，#号结束：");
				rs=s.nextDouble();
				score.add(rs);
			}
		} catch (Exception e) {
			System.out.println("结束！");
			System.out.println();
		}
		return score;
	}
	
	public void total(){
		List<Double> lists=getList();
		int n1=0,n2=0;
		double sum=0;
		for(int i=0;i<lists.size();i++){
			double rs=lists.get(i);
			if(rs!=-2&&n1<50){
				n1+=1;
				if(rs>=0&&rs<=100){
					n2+=1;
					sum+=rs;
				}
			}
		}
		
		double avg=0;
		if(n1==0){
			avg=0;
		}else{
			avg=sum/n2;
		}
		
		System.out.println("有效成绩数："+n2);
		System.out.println("总分："+sum);
		System.out.println("平均分："+avg);
	}
	
	public Double[] getDouble(){
		Scanner s=new Scanner(System.in);
		try {
			double rs; 
			for(int i=0;i<50;i++){
				System.out.println("请输入成绩，#号结束：");
				rs=s.nextDouble();
				ds[i]=rs;
			}
		} catch (Exception e) {
			System.out.println("结束！");
			System.out.println();
		}
		return ds;
	}
	
	public void total2(){
		Double[] d=getDouble();
		int n1=0,n2=0;
		double sum=0;
		for(int i=0;i<d.length;i++){
			if(d[i]==null){
				break;
			}
			double rs=d[i];
			if(rs!=-2&&n1<50){
				n1+=1;
				if(rs>=0&&rs<=100){
					n2+=1;
					sum+=rs;
				}
			}
		}
		
		double avg=0;
		if(n1==0){
			avg=0;
		}else{
			avg=sum/n2;
		}
		
		System.out.println("有效成绩数："+n2);
		System.out.println("总分："+sum);
		System.out.println("平均分："+avg);
	}
	
	public static void main(String[] args) {
		new Test06().total2();
	}

}
