<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Email Box Template</title>
<style>
  /* Reset CSS */
  body, h1, p {
    margin: 0;
    padding: 0;
    font-family: 'Times New Roman', Times, serif
  }

  /* Box Container */
  .email-box {
    width: 60%; /* 60% width on desktop */
    margin: 0 auto;
    padding: 20px;
    background: #f2f2f2;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  /* Heading */
  .email-box h1 {
    line-height: 40px;
    text-align: center;
    background: black;
    color: white;
    margin-bottom: 20px;
    padding: 10px 0;
    border-radius: 5px;
  }

  /* Body Text */
  .email-box p {
    font-size: 16px;
    line-height: 1.5;
  }

  /* Responsive Styles */
  @media screen and (max-width: 767px) {
    .email-box {
      width: 98%; /* 98% width on phone */
    }
  }
</style>
</head>
<body>

<div class="email-box">
  <h1>Tài khoản của quý khách là: </h1>
  <ul>
    <li> Email: {{$data['email']}}</li>
    <li> Password: {{$data['password']}}</li>
  </ul>
</div>

</body>
</html>
