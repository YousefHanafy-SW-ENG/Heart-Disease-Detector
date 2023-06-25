// final accountSid = 'AC691313072cd7c9f69f36740ed53143e3';
// final authToken = '74f20f326a4f046df807f724f48f3c52';
// final twilioNumber = '+201017882515';
// final recipientNumbers = ['+201159064889', '+201098736633'];
// final messageBody = 'Eshta8let ya seya3';
//
// void sendSms() async {
//   final url = Uri.parse('https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json');
//   final response = await http.post(
//     url,
//     headers: {
//       'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
//       'Content-Type': 'application/x-www-form-urlencoded',
//     },
//     body: {
//       'From': twilioNumber,
//       'To': recipientNumbers.join(','),
//       'Body': messageBody,
//     },
//   );
//
//   if (response.statusCode == 201) {
//     print('SMS message sent successfully');
//   } else {
//     print('Error sending SMS message: ${response.body}');
//   }
