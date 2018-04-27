package Test;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

public class JiSuanTest {

	public JiSuan js;
	
	@Before
	public void before(){
		if(js==null){
			js=new JiSuan();
		}
		System.out.println("开始");
	}
	
//	//加
//	@Test
//	public void testAdd() {
//		assertEquals(3, js.add(1, -2));
//	}
//	@Test
//	public void testAdd1() {
//		assertEquals(3, js.add(-1, 2));
//	}
//	@Test
//	public void testAdd2() {
//		assertEquals(3, js.add(0,3));
//	}
	
	//减
//	@Test
//	public void testSub(){
//		assertEquals(1, js.sub(2,1));
//	}
//	@Test
//	public void testSub1(){
//		assertEquals(1, js.sub(2,-1));
//	}
//	@Test
//	public void testSub2(){
//		assertEquals(2, js.sub(2,0));
//	}
	
	//乘
//	@Test
//	public void testMul() {
//		assertEquals(6, js.mul(2,3));
//	}
//	
	//除
	@Test
	@Ignore
	public void testDiv() {
		assertEquals(2, js.div(4,2));
	}
//
//	//取正
//	@Test
//	public void testNum() {
//		assertEquals(3, js.num(-3));
//	}
//	
//	@Test
//	public void testNum1() {
//		assertEquals(3, js.num(3));
//	}
//	
//	@Test
//	public void testNum2() {
//		assertEquals(0, js.num(0));
//	}
	
	@After
	public void after(){
		System.out.println("结束");
	}

}
