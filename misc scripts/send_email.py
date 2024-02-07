import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

sender_email = 'abc@gmail.com'
sender_password = 'sdlfjxlkc' # Go to google account -> App passwords

receiver_email = 'def@gmail.com'

email_title = 'test'
email_message = 'hi'

msg = MIMEMultipart()
msg['Subject'] = email_title
msg["From"] = sender_email
msg["to"] = receiver_email
msg_text = MIMEText(email_message)
msg.attach(msg_text)

file_paths =['flower.jpg', 'dog.jpg'] # files to attach
for file_path in file_paths:
    with open(file_path, 'rb') as f:
        attachment = MIMEApplication(f.read())
        attachment.add_header("Content-Disposition", "attachment", filename=f"{file_path}")
        msg.attach(attachment)

server = smtplib.SMTP("smtp.gmail.com", 587)
server.starttls()
server.login(sender_email, sender_password)
server.sendmail(sender_email, receiver_email, msg.as_string())
server.quit()
print("Done")