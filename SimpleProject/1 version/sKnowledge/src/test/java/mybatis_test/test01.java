package mybatis_test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uu.ssm.dao.DocumentDao;
import com.uu.ssm.entity.Document;
import com.uu.ssm.service.DocumentService;
import com.uu.ssm.service.UserService;
import com.uu.ssm.service.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext.xml"})
public class test01 {
	
	@Autowired
	private UserService userService;
	@Autowired
	private DocumentService docService;
	@Autowired
	private DocumentDao docDao;
	
	
//	@Test
	public void insert(){
		UserVO user=new UserVO();
		user.setId("1");
		user.setUsername("2");
		user.setPassword("3");
		user.setAvatar("1.jpg");
		user.setEnabled(1);
		user.setCreatedTime(new Date());
		userService.register(user);
	}
	
	@Test
	public void find(){
//		DocumentVO doc=new DocumentVO();
		String keywords="";
		System.out.println(docDao.mineCount("%"+keywords+"%",1522500849983L));
		List<Document> list=docDao.getMineList("%"+keywords+"%",1,10,1522500849983L);
		System.out.println(list);
	}
	
	public void test01(){
		
	}

}
