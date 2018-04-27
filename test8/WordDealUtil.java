package Tjunit;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**对名称、地址等字符串格式的内容进行格式检查
 * 或者格式化的工具类*
 **/

public class WordDealUtil{
	
/**　
 *将Java对象名称（每个单词的头字母大写）按照数据库命名的习惯进行格式化　　
 *格式化后的数据为小写字母，使用下划线分割命名单词
 *例如：EmployeeInfo 经过格式化之后变为 employee_info
 * @param name　Java对象名称　　
 **/
	
	public static String wordFormat4DB(String name){
		   
	    Pattern p = Pattern.compile("[A-Z]");  //将正则表达式编译一下，编译之后放到Pattern模式里边
            Matcher m = p.matcher(name);             // Pattern所代表的就是字符串所要匹配的模式，返回布尔值。
     	    StringBuffer sb = new StringBuffer();
	        if(m.find()){                              //表示找一个和那个I模式相匹配的子串
	            m.appendReplacement(sb, "_"+m.group());   //m.group()输出匹配到的那个子串               
	        }	        
	        return m.appendTail(sb).toString().toLowerCase();
	}
}
