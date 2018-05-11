package qawe;

import java.util.Scanner;

public class Test09 {

	public void test01() {
		float rate = 0;// 费率
		int point = 0;// 保费点数
		int age = 0;// 年龄
		char sex = 0;// 性别
		boolean isMarrige = false;// 婚否
		int fycount = 0;// 抚养人数

		String marrige = null;
		try {
			Scanner s = new Scanner(System.in);
			System.out.println("请依次输入年龄，性别，婚姻，抚养人数");
			age = s.nextInt();
			String se = s.next();
			sex = se.charAt(0);
			marrige = s.next();
			if (marrige.equals("T")) {
				isMarrige = true;
			} else if (marrige.equals("F")) {
				isMarrige = false;
			}
			fycount = s.nextInt();
		} catch (Exception e) {
			System.out.println("无效输入");
		}

		System.out.println("年龄：" + age + ",性别：" + sex + ",婚姻：" + marrige + ",抚养人数：" + fycount);

		if (age >= 20 && age <= 39) {
			point = 6;
			System.out.print("输出路径：(1)->");
		} else if (age >= 40 && age <= 59) {
			point = 4;
			System.out.print("输出路径：(2)->");
		} else if (age < 1) {
			System.out.print("输出路径：(8)->");
		} else {
			point = 2;
			System.out.print("输出路径：(3)->");
		}

		if (sex == 'M') {
			point += 5;
			System.out.print("(4)->");
		} else if (sex == 'F') {
			point += 3;
			System.out.print("(5)->");
		} else {
			System.out.print("(9)->");
		}

		if (!marrige.equals("T") && !marrige.equals("F")) {
			System.out.print("(10)->");
		} else {
			if (isMarrige) {
				point += 3;
				System.out.print("(6)->");
			} else {
				point += 5;
				System.out.print("(7)->");
			}
		}

		if (fycount == 0) {
			System.out.print("(11)");
		} else if (fycount >= 1 && fycount <= 6) {
			System.out.print("(12)");
		} else if (fycount > 6) {
			System.out.print("(13)");
		}

		float res = (float) (fycount * 0.5);
		if (res > 3.0) {
			point = point - 3;
		} else {
			point = Math.round(point - res);
		}

		if (point < 10) {
			rate = 0.1F;
		} else if (point >= 10) {
			rate = 0.6F;
		}

		System.out.println();
		System.out.println("保险费率（%）:" + rate + "%");

	}

	public void test02(int X, int Y, int Z) {	// 1
		System.out.print("路径：1->");
		int k = 0, j = 0;						// 2
		System.out.print("2->");
		System.out.print("3->");
		if ((X > 3) && (Z < 10)) 				// 3
		{										// 4
			System.out.print("4->");
			k = X * Y - 1;						// 5
			System.out.print("5->");
			j = (int) Math.sqrt(k);				// 6
			System.out.print("6->");
		} 										// 7
		System.out.print("7->");
		if ((X == 4) || (Y > 5)){				// 8
			System.out.print("8->");
			j = X * Y + 10;						// 9
			System.out.print("9->");
		}
		System.out.print("10->");
		j = j % 3;								// 10
		System.out.print("11"+"\n");
		System.out.println("输出（k,j）:k="+k+"  j="+j);
	}											// 11

	public static void main(String[] args) {
//		new Test09().test01();
		/**
		 * 2 5 5  路径：1->2->3->7->10->11  输出（k,j）:k=19  j=0
		 * 5 5 5  路径：1->2->3->4->5->6->7->10->11  输出（k,j）:k=24  j=1
		 * 2 6 5  路径：1->2->3->7->8->9->10->11  输出（k,j）:k=0  j=1
		 * 4 5 5  路径：1->2->3->4->5->6->7->8->9->10->11  输出（k,j）:k=19  j=0
		 */
		new Test09().test02(2, 6, 5);
	}

}
