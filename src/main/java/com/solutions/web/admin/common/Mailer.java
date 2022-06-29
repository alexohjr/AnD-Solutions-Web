package com.solutions.web.admin.common;

import java.io.StringWriter;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.solutions.web.admin.models.MailDTO;

public class Mailer {

	@Autowired
	private VelocityEngine velocityEngine;
	
	@Autowired
	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	public void sendMail(MailDTO mail, String name, String content) {

		MimeMessage message = mailSender.createMimeMessage();
		try {
			message.setSubject(mail.getMailSubject());
			message.setFrom(new InternetAddress(mail.getMailFrom()));
			message.addRecipient(RecipientType.TO, new InternetAddress(mail.getMailTo()));

			Template template = velocityEngine.getTemplate("email/" + mail.getTemplateName(), "UTF-8");

			VelocityContext velocityContext = new VelocityContext();

			velocityContext.put("name", name);
			velocityContext.put("content", content);

			StringWriter stringWriter = new StringWriter();
			template.merge(velocityContext, stringWriter);

			message.setText(stringWriter.toString(), "UTF-8", "html");

			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (MailException e) {
			e.printStackTrace();
		} // try - catch
	}
}
