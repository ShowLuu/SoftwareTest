<%@ page language="java" pageEncoding="utf-8" contentType="image/jpeg" import="java.awt.*, java.awt.image.*, java.util.*, javax.imageio.*"%>
<%!Color getRandColor(int fc,int bc){
	Random random=new Random();
	if(fc>255){
		fc=255;
	}
	if(bc>255){
		bc=255;
	}
	int r=fc+random.nextInt(bc-fc);
	int g=fc+random.nextInt(bc-fc);
	int b=fc+random.nextInt(bc-fc);
	return new Color(r,g,b);
}%>

<%
	out.clear();
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires",0);
	//设置宽和高
	int width=100,height=33;
	BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	Graphics g=image.getGraphics();
	Random random=new Random();
	g.setColor(getRandColor(200,250));
	g.fillRect(0, 0, width, height);
	//设置字体
	g.setFont(new Font("Times New Roman",Font.CENTER_BASELINE,25));
	g.setColor(getRandColor(160, 200));
	for(int i=0;i<255;i++){
		int x=random.nextInt(width);
		int y=random.nextInt(height);
		int x1=random.nextInt(30);
		int y1=random.nextInt(30);
		g.drawLine(x, y, x+x1, y+y1);
	}
	String verificationCode = "";
	for(int i=0;i<3;i++){
		String rand=String.valueOf((random.nextInt(89)+11));
		verificationCode+=rand;
		g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
		//设置内边距
		g.drawString(rand,28*i+9,25);
	}
	session.setAttribute("verificationCode", verificationCode);
	g.dispose();
	ImageIO.write(image,"JPEG",response.getOutputStream());
%>