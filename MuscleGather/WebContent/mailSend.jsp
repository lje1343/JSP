<%@page import="mail.MyIdPass"%>
 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.util.*" %>
    <%--�ڹ� ���� API�� ����ϱ� ���� ���� ��Ű���� import�մϴ�. --%>
    <%@ page import = "javax.activation.*" %>
    <%@ page import = "javax.mail.*" %>
    <%@ page import = "javax.mail.internet.*" %>
    <%
        request.setCharacterEncoding("euc-kr");
        String sender = request.getParameter("sender");
        String receiver = request.getParameter("receiver");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content"); 
        /*
        JavaMail�� ����Ͽ� �̸����� �����ϱ� ���� 3���� ������ ������ ����.
        1. ȣ��Ʈ �̸� ,����� ��, ��й�ȣ ��� ���� ȣ��Ʈ�� ��� ������ �����Ѵ� session ��ü�� ����ϴ�.
        2. �޽����� �����Ѵ�.
        3. �޽����� ������.
        */
        //SMTP ���� �ּ� ����
        String server = "smtp.gmail.com";
        int port = 465;
        //gamil
        try{
            Properties properties = new Properties();
            properties.put("mail.smtp.host", server);
            properties.put("mail.smtp.port",port);
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.auth","true");
            properties.put("mail.smtp.starttls.required","true");
            properties.put("mail.smtp.debug","true");
            properties.put("mail.smtp.socketF(actroy.fallback","false");
            System.out.println("1");
            /*
                ������ Properties ��ü�� ������ ������ �ν��Ͻ��� �����Ѵ�.
                public static Session getDefaultInstance(Properties pros)
                Session Ŭ������ ������� ���̸�, ��ȣ , ���� ������ ����
                ���� ������ �̿��ϴµ� �ʿ��� �̸��� ���� ������ �����Ѵ�.
            */
            Session s = Session.getDefaultInstance(properties);
            //������ ���ϰ� �޴� �ּҸ� �����Ѵ�.
            Address sender_address = new InternetAddress(sender);
            Address receiver_address = new InternetAddress(receiver);
            //������ ������ ���� ������ �Է��ϱ� ���� Message ��ü�� �����Ѵ�.
            Message message = new MimeMessage(s);
            //������ ������ ������ �ѱ��� ��� ������ �ʵ��� content-type�� �����Ѵ�.
            message.setHeader("content-type", "text/html;charset=euc-kr");
            //������ ���� �ּ� ������ �����Ѵ�.
            System.out.println("2");
            message.setFrom(sender_address);
            //�޴� ���� �ּ� ������ �����Ѵ�.
            //Message.RecipientType �� Message Ŭ�������� ����ϴ� ������ ������ �����Ѵ�.
            //MessageRecipientType.To : �޴� ����� �ǹ��Ѵ�.
            message.addRecipient(Message.RecipientType.TO, receiver_address);
            //���� ������ �����Ѵ�.
            System.out.println("3");
            message.setSubject(subject);
            //mailex.jsp
            message.setContent(content, "text/html;charset=euc-kr");
            //������ ��¥ ���� 
            message.setSentDate(new Date());
            //ù��° ���ڴ� ������ ȣ��Ʈ�̴�.
            //�ι�° ���ڴ� ���̵�, ����° ���ڴ� ��й�ȣ�� �ǹ�
            System.out.println("4");
            Transport transport = s.getTransport("smtp");
            System.out.println("5");
            transport.connect(server, "lje1343", MyIdPass.gmailpass);// ��¥ ���̵� ��� ���� ��
            System.out.println("6");
            transport.sendMessage(message, message.getAllRecipients());
            System.out.println("7");
            transport.close(); //��������
            
            out.println("<h3>������ ���������� ���۵Ǿ����ϴ�.</h3>");
            
        }catch(Exception e){
            out.println("SMTP ������ �߸� �����Ǿ��ų�, ���񽺿� ������ �ִ�.");
            e.printStackTrace();
        }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
</body>
</html>

