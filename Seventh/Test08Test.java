import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class Test08Test {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	// 测试两个以上为大写大写
	@Test
	public void test01() {
		String res = Test08.test01("useRInfo");
		System.out.println("test01-->"+res);
		assertEquals("use_r_info", res);
	}

	// 测试""
	@Test
	public void test02() {
		String res = Test08.test01("");
		System.out.println("test02-->"+res);
		assertEquals("", res);
	}

	// 测试带有空字符串
	@Test
	public void test03() {
		String res = Test08.test01("User info");
		System.out.println("test03-->"+res);
		assertEquals("userinfo", res);
	}

	// 测试传null对象
	@Test
	public void test04() {
		String res = Test08.test01(null);
		System.out.println("test04-->"+res);
		assertEquals("", res);
	}

	// 测试开头大写
	@Test
	public void test05() {
		String res = Test08.test01("UserInfo");
		System.out.println("test05-->"+res);
		assertEquals("user_info", res);
	}

	// 测试结尾大写
//	@Test
//	public void test06() {
//		String res = Test08.test01("userInfO");
//		System.out.println("test06-->"+res);
//		assertEquals("user_info", res);
//	}

	// 测试带有特殊字符
	@Test
	public void test06() {
		String res = Test08.test01("user@$Info");
		System.out.println("test07-->"+res);
		assertEquals("user_info", res);
	}

	// 测试带有中文
	@Test
	public void test07() {
		String res = Test08.test01("user用户Info");
		System.out.println("test08-->"+res);
		assertEquals("user_info", res);
	}

}
