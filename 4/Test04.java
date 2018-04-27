package com.ss.yinguotu;

import java.util.Scanner;

public class Test04 {

	public void test01() {

		try {
			Scanner s = new Scanner(System.in);
			int n = 0, k = 0, r = 0, max = 0;
			System.out.println("请输入max: ");
			max = s.nextInt();
			System.out.println("请输入n: ");
			n = s.nextInt();
			if (n < 0) {
				n = -n;
			}
			while ((n > k) && (r <= max)) {
				k = k + 1;
				r = r + k;
			}
			if (r <= max) {
				System.out.println("结果r：" + r);
			} else {
				System.out.println("Error:too large");
			}
		} catch (Exception e) {
			System.out.println("输入有误，请重新输入");
			this.test01();
		}

	}

	public void test02() {

		Scanner s = new Scanner(System.in);
		int n = 0, k = 0, r = 0, max = 0;
		System.out.println("请输入max: ");
		max = s.nextInt();
		System.out.println("请输入n: ");
		n = s.nextInt();
		if (n < 0) {
			n = -n;
		}
		test02Util(n, max, k, r);
	}

	public void test02Util(int n, int max, int k, int r) {

		if ((n > k) && (r <= max)) {
			k = k + 1;
			r = r + k;
			test02Util(n, max, k, r);
		}
		if (r <= max) {
			System.out.println("结果r为：" + r);
		} else {
			System.out.println("Error:too large");
		}
	}

	public static void main(String[] args) {
		new Test04().test01();
	}

}
