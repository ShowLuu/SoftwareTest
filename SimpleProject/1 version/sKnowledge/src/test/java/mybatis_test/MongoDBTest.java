package mybatis_test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsCriteria;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mongodb.client.gridfs.model.GridFSUploadOptions;
import com.mongodb.gridfs.GridFSDBFile;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext-mongodb.xml"})
public class MongoDBTest {

	@Autowired
	private GridFsTemplate gridFsTemplate;
	
	@Test
	@Ignore
	public void upload(){
		File file=new File("D:/Test/io/Test.txt");
		try {
			FileInputStream in=new FileInputStream(file);
			GridFSUploadOptions options=new GridFSUploadOptions();
			options.chunkSizeBytes(1048576);
			Map<String , Object> meta=new HashMap<>();
			meta.put("userId", "128821");
			meta.put("keywords", "io");
			options.metadata(new Document(meta));
			com.mongodb.gridfs.GridFSFile f=gridFsTemplate.store(in,"io", options);
			System.out.println(f);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void find() {
		Query query = new Query();
		query.addCriteria(GridFsCriteria.where("_id").is(new ObjectId("59bddc340e462212b0ba2729")));

		GridFSDBFile file = gridFsTemplate.findOne(query);
		System.out.println(file);
	}
	
}
