package com.ss.yinguotu;
import java.util.Scanner;

public class Test03 {
	
	public void test01(){
		int money,s;
		int c = 0;
		int p = 0;
		Scanner sc=new Scanner(System.in);
		System.out.print("�������");
		money=sc.nextInt();
		try {
			if(money>=10){
				int count=money/10;
				int l=money%10;
				for(int i=0;i<count;i++){
					System.out.print("��������������0:��Ǯ,1.��֭;2.ơ��:");
					s=sc.nextInt();
					if(s==1){
						System.out.println("��"+(i+1)+"�ι���"+"����֭�� ����");
						c++;
						continue;
					}else if(s==2){
						System.out.println("��"+(i+1)+"�ι���"+"��ơ�ơ� ����");
						p++;
						continue;
					}else if(s==0){
						int result=i*10+l;
						System.out.println("������"+c+"ƿ��֭��"+p+"ƿơ�ƣ�"+"��������"+result+"Ԫ");
						return;
					}else{
						System.out.println("��������������ѡ��");
						i--;
						continue;
					}
				}
				System.out.println("������"+c+"ƿ��֭��"+p+"ƿơ�ƣ�ʣ�಻��10Ԫ���޷����򣬼�������"+l+"Ԫ");
			}else{
				System.out.println("Ͷ��С��10Ԫ���޷�����");
			}
		} catch (Exception e) {
			System.out.println("������������ֵ��");
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
