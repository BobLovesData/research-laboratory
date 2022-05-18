import smtplib
from email.message import EmailMessage

from_address = ''
to_address = ''
password = ''
smtp_server = 'smtp.gmail.com'
smtp_port = 465


msg = EmailMessage()
msg['From'] = from_address
msg['To'] = to_address
msg['Subject'] = 'Empty Directory In EOD Data'
msg.set_content('There are no files in ')
server = smtplib.SMTP_SSL(smtp_server, smtp_port)
server.login(from_address, password)
server.send_message(msg)
server.quit()
