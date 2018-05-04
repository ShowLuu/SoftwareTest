package show.lu.sofeware;

import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test08 {

	public static String formatDate(String strUnFormatted) {

		// 如果输入字符串为null，返回""
		String strTemp = ((strUnFormatted == null) ? "" : strUnFormatted);

		if (!strTemp.equals("")) {

			// 使用StringTokenizer，依照"-"来分隔输入字符串
			StringTokenizer st = new StringTokenizer(strTemp, "-");

			// 分别取得年月日
			String strMM = st.nextToken();
			String strDD = st.nextToken();
			String strYYYY = st.nextToken();

			if (strMM.length() < 2 && Integer.parseInt(strMM) < 10) {
				// 给只有一位数字的月份在高位补一个0
				strMM = "0" + strMM;
			}

			if (strDD.length() < 2 && Integer.parseInt(strDD) < 10) {
				// 给只有一位数字的日期在高位补一个0
				strDD = "0" + strDD;
			}

			if (strYYYY.length() < 4 && Integer.parseInt(strYYYY) < 100) {
				// 给两位数字的年份的高位补上20
				strYYYY = "20" + strYYYY;
			}
			strTemp = strMM + "-" + strDD + "-" + strYYYY;
		}
		return strTemp;
	}

	public static String formatDate2(String strUnFormatted) {
		strUnFormatted=checkStr(strUnFormatted);
		if(strUnFormatted.equals("errorEX")){
			return "不可存在特殊字符";
		}else if(strUnFormatted.equals("errorStr")){
			return "不可存在汉字";
		}else if(strUnFormatted.equals("errorEn")){
			return "不可存在字母";
		}
		// 如果输入字符串为null，返回""
		String strTemp = ((strUnFormatted == null) ? "" : strUnFormatted);
		if (!strTemp.equals("")) {
			// 使用StringTokenizer，依照"-"来分隔输入字符串
			StringTokenizer st = new StringTokenizer(strTemp, "-");
			// 分别取得年月日
			String strMM;
			int day;
			String strDD;
			String strYYYY;
			try {
				strMM = st.nextToken();
				day = checkMonth(strMM);
				strDD = st.nextToken();
				strYYYY = st.nextToken();
			} catch (Exception e) {
				return "格式错误，请以xx-xx-xxxx格式输入";
			}
			int res = checkYear(strYYYY);
			if (res == 1) {
				System.out.println("为闰年");
				if (day == 0) {
					day = 29;
				}
			} else if (res == 0) {
				System.out.println("不为闰年");
				if (day == 0) {
					day = 28;
				}
			} else {
				return "月份错误";
			}

			if (strMM.length() < 2 && Integer.parseInt(strMM) < 10) {
				// 给只有一位数字的月份在高位补一个0
				strMM = "0" + strMM;
			}
			if (Integer.parseInt(strDD) <= day) {
				if (strDD.length() < 2) {
					// 给只有一位数字的日期在高位补一个0
					strDD = "0" + strDD;
				}
			} else {
				return "天数错误";
			}

			if (strYYYY.length() == 1) {
				strYYYY = "200" + strYYYY;
			} else if (strYYYY.length() == 2) {
				strYYYY = "20" + strYYYY;
			} else if (strYYYY.length() == 3) {
				strYYYY = "2" + strYYYY;
			} else if (strYYYY.length() == 4) {

			} else {
				return "格式错误，请以xx-xx-xxxx格式输入";
			}
			strTemp = strMM + "-" + strDD + "-" + strYYYY;
		}
		return strTemp;
	}

	public static String checkStr(String str) {
		Pattern p = null;
		Matcher m = null;
		
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		p = Pattern.compile(regEx);
		m = p.matcher(str);
		//判断字符串中是否含有特殊字符
		if (m.find()) {
			// 过滤特殊字符
//			str = m.replaceAll("").trim();
			return "errorEx";
		}
		
		//是否汉字
//		String regStr="[\\u4e00-\\u9fa5]";
		//是否汉字和字母
		String regStr="[\u4E00-\u9FA5]";
		p = Pattern.compile(regStr);
		m = p.matcher(str);
		//判断字符串中是否含有汉字
		if (m.find()) {
			return "errorStr";
		}
		//过滤汉字
//		str=str.replaceAll("[\\u4e00-\\u9fa5]", "");
		
		//是否字母
		String regEn=".*[a-zA-z].*";
		p = Pattern.compile(regEn);
		m = p.matcher(str);
		//判断字符串中是否含有汉字
		if (m.find()) {
			return "errorEn";
		}
		//过滤汉字
//		str=str.replaceAll("[\\u4e00-\\u9fa5]", "");
		return str;
	}

	// 31，28,31,30,31,30,31,31,30,31,30，31
	public static int checkMonth(String str) {
		int month = Integer.valueOf(str);
		if (month == 0 && month > 12) {
			return -1;
		}
		int day = 0;
		if (month == 2) {
			return day;
		}
		if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10)
				|| (month == 12)) {
			day = 31;
		} else {
			day = 30;
		}
		return day;
	}

	public static int checkYear(String str) {
		int year = Integer.valueOf(str);
		int flag = 0;
		// 判定
		if ((year / 4 == 0) && (year / 100 != 0)) {
			flag = 1;
		}
		return flag;
	}

	public static void main(String[] args) {
		String str = Test08.formatDate2("2-28-2018");
		System.out.println("16=" + str);
	}

}
