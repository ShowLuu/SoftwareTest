package Tjunit;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**�����ơ���ַ���ַ�����ʽ�����ݽ��и�ʽ���
 * ���߸�ʽ���Ĺ�����*
 **/

public class WordDealUtil{
	
/**��
 *��Java�������ƣ�ÿ�����ʵ�ͷ��ĸ��д���������ݿ�������ϰ�߽��и�ʽ������
 *��ʽ���������ΪСд��ĸ��ʹ���»��߷ָ���������
 *���磺EmployeeInfo ������ʽ��֮���Ϊ employee_info
 * @param name��Java�������ơ���
 **/
	
	public static String wordFormat4DB(String name){
		   
	    Pattern p = Pattern.compile("[A-Z]");  //��������ʽ����һ�£�����֮��ŵ�Patternģʽ���
            Matcher m = p.matcher(name);             // Pattern������ľ����ַ�����Ҫƥ���ģʽ�����ز���ֵ��
     	    StringBuffer sb = new StringBuffer();
	        if(m.find()){                              //��ʾ��һ�����Ǹ�Iģʽ��ƥ����Ӵ�
	            m.appendReplacement(sb, "_"+m.group());   //m.group()���ƥ�䵽���Ǹ��Ӵ�               
	        }	        
	        return m.appendTail(sb).toString().toLowerCase();
	}
}
