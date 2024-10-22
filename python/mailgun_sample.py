import requests

def send_simple_message():
    return requests.post(
        "https://api.mailgun.net/v3/<API-PATH>/messages",
        auth=("api", "<API KEY>"),
        data={"from": "Postmaster <from@email.com>",
              "to": ["<TO-EMAIL>", "<SECOND-TO-EMAIL>"],
              "subject": "Hello",
              "text": "Testing some Mailgun awesomness!"})

send_simple_message()
