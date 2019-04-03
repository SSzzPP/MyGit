package com.yhlt.showcase.base.utils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
@Component
public class EmailUtil {
	
	private static JavaMailSender javaMailSender;
	/**
	 * 发件人
	 */
	private static String from;
	/**
	 * 发送html格式邮件
	 * @param to
	 * @param title
	 * @param content
	 */
	public static void sendHtmlEmail(String to, String title, String content) {
        MimeMessage message = javaMailSender.createMimeMessage();//创建一个MINE消息
        try {
            //true表示需要创建一个multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(title);
            helper.setText(content, true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
           e.printStackTrace();
        }
    }
	
	@Value("${mail.fromMail.addr}")
	public void setFrom(String addr) {
		EmailUtil.from = addr;
	}

	@Autowired(required=true)
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		EmailUtil.javaMailSender = javaMailSender;
	}

	public JavaMailSender getJavaMailSender() {
		return EmailUtil.javaMailSender;
	}

	public String getFrom() {
		return EmailUtil.from;
	}
	
}
