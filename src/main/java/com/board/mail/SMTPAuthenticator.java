package com.board.mail;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {
        // ���̹��� Gmail ����� ���� ����.
        // Gmail�� ��� @gmail.com�� ������ ���̵� �Է��Ѵ�.
        return new PasswordAuthentication("cooljohn72", "���...");
    }

}