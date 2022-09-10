curl -s --user 'api:<KEY> \
    https://api.mailgun.net/v3/subdomain.domain.com/messages \
    -F from='eddyizm <mailgun@subdomain.domain.com>' \
    -F to=youremail@mail.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomeness!'