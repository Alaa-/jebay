package ebay;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.sun.mail.smtp.SMTPSSLTransport;

public class SendMail1 {
static String message;
static String to;
static String subject;
public static void main() throws Exception{

String from = "jebayiiitb@gmail.com";
//String to = "siva.gontla@gmail.com";
//String subject = "WILDLIFE-CONFIRMATION LINK";
//message = "<html><h1>This is A test message sent via Gmail</h1></html>";
SendMail sendMail = new SendMail(from, to, subject, message);
sendMail.send();
}
}

class SendMail {
private String from;
private  String to;
private String subject;
private String text;
public SendMail(String from, String to, String subject, String text) throws Exception {
this.from = from; this.to = to; this.subject = subject;this.text = text;}

public void send(){
Thread.currentThread().setContextClassLoader(this.getClass().getClassLoader());
String host ="smtp.gmail.com";
String userid = "jebayiiitb@gmail.com";
String password = "9742375600";
try
{
//SendMailExample sem=new SendMailExample();
Properties system=System.getProperties();
system.put("proxyHost","192.16.3.254");
		system.put("proxyPort","8080");
		System.setProperties(system);
Properties props = System.getProperties();

props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", host);
props.setProperty("mail.transport.protocol", "smtps");
props.put("mail.smtp.user", userid);
props.put("mail.smtp.password", password);
props.put("mail.smtp.port", "587");
props.put("mail.smtps.auth", "true");
props.put("mail.smtp.socketFactory.port","587");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

Session session = Session.getDefaultInstance(props, null);
MimeMessage message = new MimeMessage(session);
message.setContent(SendMail1.message,"text/html");
InternetAddress fromAddress = null;
InternetAddress toAddress = null;

try {
fromAddress = new InternetAddress(from);
toAddress = new InternetAddress(to);
} catch (AddressException e) {

e.printStackTrace();
}
message.setFrom(fromAddress);
message.setRecipient(RecipientType.TO, toAddress);
message.setSubject(subject);
//message.setText(text);

//SMTPSSLTransport transport =(SMTPSSLTransport)session.getTransport("smtps");

Transport transport = session.getTransport("smtps");
transport.connect(host, userid, password);
transport.sendMessage(message, message.getAllRecipients());
transport.close();
} catch (MessagingException e) {
e.printStackTrace();
}
}
} 