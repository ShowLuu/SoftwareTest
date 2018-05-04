package show.lu.sofeware;

import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test08 {

	public static String formatDate(String strUnFormatted) {

		// ��������ַ���Ϊnull������""
		String strTemp = ((strUnFormatted == null) ? "" : strUnFormatted);

		if (!strTemp.equals("")) {

			// ʹ��StringTokenizer������"-"���ָ������ַ���
			StringTokenizer st = new StringTokenizer(strTemp, "-");

			// �ֱ�ȡ��������
			String strMM = st.nextToken();
			String strDD = st.nextToken();
			String strYYYY = st.nextToken();

			if (strMM.length() < 2 && Integer.parseInt(strMM) < 10) {
				// ��ֻ��һλ���ֵ��·��ڸ�λ��һ��0
				strMM = "0" + strMM;
			}

			if (strDD.length() < 2 && Integer.parseInt(strDD) < 10) {
				// ��ֻ��һλ���ֵ������ڸ�λ��һ��0
				strDD = "0" + strDD;
			}

			if (strYYYY.length() < 4 && Integer.parseInt(strYYYY) < 100) {
				// ����λ���ֵ���ݵĸ�λ����20
				strYYYY = "20" + strYYYY;
			}
			strTemp = strMM + "-" + strDD + "-" + strYYYY;
		}
		return strTemp;
	}

	public static String formatDate2(String strUnFormatted) {
		strUnFormatted=checkStr(strUnFormatted);
		if(strUnFormatted.equals("errorEX")){
			return "���ɴ��������ַ�";
		}else if(strUnFormatted.equals("errorStr")){
			return "���ɴ��ں���";
		}else if(strUnFormatted.equals("errorEn")){
			return "���ɴ�����ĸ";
		}
		// ��������ַ���Ϊnull������""
		String strTemp = ((strUnFormatted == null) ? "" : strUnFormatted);
		if (!strTemp.equals("")) {
			// ʹ��StringTokenizer������"-"���ָ������ַ���
			StringTokenizer st = new StringTokenizer(strTemp, "-");
			// �ֱ�ȡ��������
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
				return "��ʽ��������xx-xx-xxxx��ʽ����";
			}
			int res = checkYear(strYYYY);
			if (res == 1) {
				System.out.println("Ϊ����");
				if (day == 0) {
					day = 29;
				}
			} else if (res == 0) {
				System.out.println("��Ϊ����");
				if (day == 0) {
					day = 28;
				}
			} else {
				return "�·ݴ���";
			}

			if (strMM.length() < 2 && Integer.parseInt(strMM) < 10) {
				// ��ֻ��һλ���ֵ��·��ڸ�λ��һ��0
				strMM = "0" + strMM;
			}
			if (Integer.parseInt(strDD) <= day) {
				if (strDD.length() < 2) {
					// ��ֻ��һλ���ֵ������ڸ�λ��һ��0
					strDD = "0" + strDD;
				}
			} else {
				return "��������";
			}

			if (strYYYY.length() == 1) {
				strYYYY = "200" + strYYYY;
			} else if (strYYYY.length() == 2) {
				strYYYY = "20" + strYYYY;
			} else if (strYYYY.length() == 3) {
				strYYYY = "2" + strYYYY;
			} else if (strYYYY.length() == 4) {

			} else {
				return "��ʽ��������xx-xx-xxxx��ʽ����";
			}
			strTemp = strMM + "-" + strDD + "-" + strYYYY;
		}
		return strTemp;
	}

	public static String checkStr(String str) {
		Pattern p = null;
		Matcher m = null;
		
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~��@#��%����&*��������+|{}������������������������]";
		p = Pattern.compile(regEx);
		m = p.matcher(str);
		//�ж��ַ������Ƿ��������ַ�
		if (m.find()) {
			// ���������ַ�
//			str = m.replaceAll("").trim();
			return "errorEx";
		}
		
		//�Ƿ���
//		String regStr="[\\u4e00-\\u9fa5]";
		//�Ƿ��ֺ���ĸ
		String regStr="[\u4E00-\u9FA5]";
		p = Pattern.compile(regStr);
		m = p.matcher(str);
		//�ж��ַ������Ƿ��к���
		if (m.find()) {
			return "errorStr";
		}
		//���˺���
//		str=str.replaceAll("[\\u4e00-\\u9fa5]", "");
		
		//�Ƿ���ĸ
		String regEn=".*[a-zA-z].*";
		p = Pattern.compile(regEn);
		m = p.matcher(str);
		//�ж��ַ������Ƿ��к���
		if (m.find()) {
			return "errorEn";
		}
		//���˺���
//		str=str.replaceAll("[\\u4e00-\\u9fa5]", "");
		return str;
	}

	// 31��28,31,30,31,30,31,31,30,31,30��31
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
		// �ж�
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
