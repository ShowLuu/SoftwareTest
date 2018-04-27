import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test08 {

	public static String test01(String name) {
		if(name==null){
			return "����null";
		}
		
		if(name==null){
			return "���ܿ��ַ���";
		}
		
		//ȥ""
		name=name.replaceAll(" ", "");
		
		Pattern p = null;
		Matcher m = null;
		
		//���������ַ�
		String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~��@#��%����&*��������+|{}������������������������]"; 
		p = Pattern.compile(regEx); 
		m = p.matcher(name);
		if(m.find()){
//			System.out.println("�����������ַ�");
			name=m.replaceAll("").trim();
		}
		
		//���˺���
		name=name.replaceAll("[\\u4e00-\\u9fa5]", "");
		
		//���˴�д��ĸ
		p = Pattern.compile("[A-Z]"); // ��������ʽ����һ�£�����֮��ŵ�Patternģʽ���
		m = p.matcher(name); // Pattern������ľ����ַ�����Ҫƥ���ģʽ�����ز���ֵ��
		StringBuffer sb = new StringBuffer();
		while (m.find()) { // ��ʾ��һ�����Ǹ�Iģʽ��ƥ����Ӵ�
			if(m.start()!=0){
				m.appendReplacement(sb, "_" + m.group()); // m.group()���ƥ�䵽���Ǹ��Ӵ�
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
		Pattern p = Pattern.compile("[A-Z]"); // ��������ʽ����һ�£�����֮��ŵ�Patternģʽ���
		Matcher m = p.matcher(name); // Pattern������ľ����ַ�����Ҫƥ���ģʽ�����ز���ֵ��
		StringBuffer sb = new StringBuffer();
		if (m.find()) { // ��ʾ��һ�����Ǹ�Iģʽ��ƥ����Ӵ�
			m.appendReplacement(sb, "_" + m.group()); // m.group()���ƥ�䵽���Ǹ��Ӵ�
		}
		return m.appendTail(sb).toString().toLowerCase();
	}

}
