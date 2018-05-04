package show.lu.sofeware;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class Test08Test {

	@Test
	public void test() {
		String str = Test08.formatDate("05-04-2018");
		System.out.println("0=" + str);
		assertEquals("05-04-2018", str);
	}

	@Test
	public void test1() {
		String str = Test08.formatDate("5-04-2018");
		System.out.println("1=" + str);
		assertEquals("05-04-2018", str);
	}

	@Test
	public void tes2() {
		String str = Test08.formatDate("05-4-2018");
		System.out.println("2=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:05-04-20018
	@Test
	public void tes3() {
		String str = Test08.formatDate("05-04-018");
		System.out.println("3=" + str);
		assertEquals("05-04-2018", str);
	}

	@Test
	public void tes4() {
		String str = Test08.formatDate("05-04-18");
		System.out.println("4=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:""
	@Test
	public void tes5() {
		String str = Test08.formatDate("");
		System.out.println("5=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	@Test
	public void tes6() {
		String str = Test08.formatDate("-04-2018");
		System.out.println("6=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	@Test
	public void tes7() {
		String str = Test08.formatDate("-05-2018");
		System.out.println("7=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException
	@Test
	public void tes8() {
		String str = Test08.formatDate("--2018");
		System.out.println("8=" + str);
		assertEquals("05-04-2018", str);
	}

	// error result:05-04-208
	@Test
	public void test9() {
		String str = Test08.formatDate("05-04-8");
		System.out.println("9=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException 参数必须是？-？-？格式
	@Test
	public void test10() {
		String str = Test08.formatDate("05041028");
		System.out.println("10=" + str);
		assertEquals("05-04-2018", str);
	}

	// java.util.NoSuchElementException 参数必须是？-？-？格式
	@Test
	public void test11() {
		String str = Test08.formatDate("0504-1028");
		System.out.println("11=" + str);
		assertEquals("05-04-2018", str);
	}

	// 月份不能大于13也不能为0
	@Test
	public void test12() {
		String str = Test08.formatDate("13-04-2018");
		System.out.println("12=" + str);
		assertEquals("05-04-2018", str);
	}

	// 每月下的天数根据该月而定也不能为0
	@Test
	public void test13() {
		String str = Test08.formatDate("05-32-2018");
		System.out.println("13=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在特殊字符
	@Test
	public void test14() {
		String str = Test08.formatDate("5#-31-2018");
		System.out.println("14=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在汉字
	@Test
	public void test15() {
		String str = Test08.formatDate("有5-31-2018");
		System.out.println("15=" + str);
		assertEquals("05-04-2018", str);
	}

	// 存在字母
	@Test
	public void test20() {
		String str = Test08.formatDate("a5-31-2018");
		System.out.println("20=" + str);
		assertEquals("05-04-2018", str);
	}

	// 2月问题
	@Test
	public void test16() {
		String str = Test08.formatDate("2-28-2018");
		System.out.println("16=" + str);
		assertEquals("02-28-2018", str);
	}

	// 2月问题
	@Test
	public void test17() {
		String str = Test08.formatDate("2-29-2018");
		System.out.println("17=" + str);
		assertEquals("02-29-2018", str);
	}

	// 其他月问题
	@Test
	public void test18() {
		String str = Test08.formatDate("4-30-2018");
		System.out.println("18=" + str);
		assertEquals("04-30-2018", str);
	}

	// 其他月问题
	@Test
	public void test19() {
		String str = Test08.formatDate("4-31-2018");
		System.out.println("1=" + str);
		assertEquals("04-31-2018", str);
	}

}
