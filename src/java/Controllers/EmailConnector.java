
package Controllers;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author Tharindu Konesh
 */
public class EmailConnector {
    private static final String username = "tharinduekanayake23@gmail.com";
    private static final String appPassword = "hnfcqhyphllbjnbk";
    protected static final Properties props = new Properties();

    private Session session;

    public EmailConnector() {
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        this.session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, appPassword);
            }
        });
    }

    public void send(String mailRecipient, String mailSubject, String mailText) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailRecipient));
            message.setSubject(mailSubject);
            message.setText(mailText);

            Transport.send(message);

            System.out.println("Email sent successfully");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    public static void main(String[] args) {
        EmailConnector emailSender = new EmailConnector();
        emailSender.send("tharindu.konesh2015@gmail.com","test","testing mail");
    }
}

