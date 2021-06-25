### START SETUP
server_name="Production Google"
server_link="https://www.google.com/"
# SLACK HOOK URL
webhook_url="https://hooks.slack.com/services/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"
### END SETUP
# REBUILD APP
# e.g.
# docker-compose down
# docker-compose up --build -d

# SHARE TO SLACK
template='{
    "blocks": [
        {
            "type": "header",
            "text": {
                "type": "plain_text",
                "text": ":rocket: '${server_name}' Rebuild ...",
                "emoji": true
            }
        },
        {
            "type": "section",
            "block_id": "section567",
            "text": {
                "type": "mrkdwn",
                "text": "Rebuilding an application can take a while to complete and depends on the server condition & network latency.\n  \n <'${server_link}'|View Website>"
            },
            "accessory": {
                "type": "image",
                "image_url": "https://i.pinimg.com/originals/81/8f/da/818fdabed78e8f1e80a71282bf695d3a.gif",
                "alt_text": "Rebuild"
            }
        },
        {
            "type": "section",
            "block_id": "section789",
            "fields": [
                {
                    "type": "mrkdwn",
                    "text": "<http://github.com/coroo/sergio|Sergio> © 2021"
                }
            ]
        }
    ]
}'
curl -X POST -H 'Content-type: application/json' --data "${template}" "${webhook_url}"