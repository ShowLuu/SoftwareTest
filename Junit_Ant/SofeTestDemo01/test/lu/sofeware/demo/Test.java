package lu.sofeware.demo;

import junit.framework.TestCase;
import lu.sofeware.DateForm;
import lu.sofeware.Jisuan;

public class Test extends TestCase{

	
	public void test() {
		String str = DateForm.formatDate2("05-04-2018");
		System.out.println("0=" + str);
		assertEquals("05-04-2018", str);
	}

	
	public void test1() {
		String str = DateForm.formatDate2("5-04-2018");
		System.out.println("1=" + str);
		assertEquals("05-04-2018", str);
	}

	
	public void test2() {
		String str = DateForm.formatDate2("05-4-2018");
		System.out.println("2=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:05-04-20018
	
	public void test3() {
		String str = DateForm.formatDate2("05-04-018");
		System.out.println("3=" + str);
		assertEquals("05-04-2018", str);
	}

	
	public void test4() {
		String str = DateForm.formatDate2("05-04-18");
		System.out.println("4=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:""
	
	public void test5() {
		String str = DateForm.formatDate2("");
		System.out.println("5=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	
	public void test6() {
		String str = DateForm.formatDate2("-04-2018");
		System.out.println("6=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	
	public void test7() {
		String str = DateForm.formatDate2("-05-2018");
		System.out.println("7=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	
	public void test8() {
		String str = DateForm.formatDate2("--2018");
		System.out.println("8=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:05-04-208
	
	public void test9() {
		String str = DateForm.formatDate2("05-04-8");
		System.out.println("9=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException 参数必须是？-？-？格式
	
	public void test10() {
		String str = DateForm.formatDate2("05041028");
		System.out.println("10=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException 参数必须是？-？-？格式
	
	public void test11() {
		String str = DateForm.formatDate2("0504-1028");
		System.out.println("11=" + str);
		assertEquals("05-04-2018", str);
	}

	// 月份不能大于13也不能为0
	
	public void test12() {
		String str = DateForm.formatDate2("13-04-2018");
		System.out.println("12=" + str);
		assertEquals("05-04-2018", str);
	}

	// 每月下的天数根据该月而定也不能为0
	
	public void test13() {
		String str = DateForm.formatDate2("05-32-2018");
		System.out.println("13=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在特殊字符
	
	public void test14() {
		String str = DateForm.formatDate2("5#-31-2018");
		System.out.println("14=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在汉字
	
	public void test15() {
		String str = DateForm.formatDate2("有5-31-2018");
		System.out.println("15=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在字母
	
	public void test20() {
		String str = DateForm.formatDate2("a5-31-2018");
		System.out.println("20=" + str);
		assertEquals("05-04-2018", str);
	}

	// 2月问题
	
	public void test16() {
		String str = DateForm.formatDate2("2-28-2018");
		System.out.println("16=" + str);
		assertEquals("02-28-2018", str);
	}

	// 2月问题
	
	public void test17() {
		String str = DateForm.formatDate2("2-29-2018");
		System.out.println("17=" + str);
		assertEquals("02-29-2018", str);
	}

	// 其他月问题
	
	public void test18() {
		String str = DateForm.formatDate2("4-30-2018");
		System.out.println("18=" + str);
		assertEquals("04-30-2018", str);
	}

	// 其他月问题
	
	public void test19() {
		String str = DateForm.formatDate2("4-31-2018");
		System.out.println("1=" + str);
		assertEquals("04-31-2018", str);
	}
	
	public void test21(){
		int ex=Jisuan.add(1, 2);
		assertEquals(2, ex);
	}
	
	public void test22(){
		int ex=Jisuan.add(1, 2);
		assertEquals(4, ex);
	}
	
	public void test23(){
		int ex=Jisuan.add(2, 2);
		assertEquals(4, ex);
	}
	
	public void test24(){
		int ex=Jisuan.add(1, 2);
		assertEquals(3, ex);
	}
	
	public void test25(){
		int ex=Jisuan.min(2, 2);
		assertEquals(0, ex);
	}
	
	public void test26(){
		int ex=Jisuan.min(1, 2);
		assertEquals(1, ex);
	}

}