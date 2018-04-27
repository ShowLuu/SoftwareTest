import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test08 {

	public static String test01(String name) {
		if(name==null){
			return "不能null";
		}
		
		if(name==null){
			return "不能空字符串";
		}
		
		//去""
		name=name.replaceAll(" ", "");
		
		Pattern p = null;
		Matcher m = null;
		
		//过滤特殊字符
		String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]"; 
		p = Pattern.compile(regEx); 
		m = p.matcher(name);
		if(m.find()){
//			System.out.println("发现有特殊字符");
			name=m.replaceAll("").trim();
		}
		
		//过滤汉字
		name=name.replaceAll("[\\u4e00-\\u9fa5]", "");
		
		//过滤大写字母
		p = Pattern.compile("[A-Z]"); // 将正则表达式编译一下，编译之后放到Pattern模式里边
		m = p.matcher(name); // Pattern所代表的就是字符串所要匹配的模式，返回布尔值。
		StringBuffer sb = new StringBuffer();
		while (m.find()) { // 表示找一个和那个I模式相匹配的子串
			if(m.start()!=0){
				m.appendReplacement(sb, "_" + m.group()); // m.group()输出匹配到的那个子串
			}
		}
		return m.appendTail(sb).toString().toLowerCase();
	}

	public static void main(String[] args) {
		String str=" asufd adf a";
		System.out.println(str);
		str=str.replaceAll(" ", "");
		System.out.println(str);
	}
	
	public String test02(String name) {
		Pattern p = Pattern.compile("[A-Z]"); // 将正则表达式编译一下，编译之后放到Pattern模式里边
		Matcher m = p.matcher(name); // Pattern所代表的就是字符串所要匹配的模式，返回布尔值。
		StringBuffer sb = new StringBuffer();
		if (m.find()) { // 表示找一个和那个I模式相匹配的子串
			m.appendReplacement(sb, "_" + m.group()); // m.group()输出匹配到的那个子串
		}
		return m.appendTail(sb).toString().toLowerCase();
	}

}
