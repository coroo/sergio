### START SETUP
server_name="Production Google"
server_link="https://www.google.com/"
# SLACK HOOK URL
webhook_url="https://hooks.slack.com/services/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"
### END SETUP

post_response=$(curl -s -o /dev/null -w "%{http_code}|%{content_type}|%{remote_ip}|%{remote_port}|%{scheme}|%{time_total}" ${server_link})
IFS='|' read -r -a array <<< "$post_response"
http_response="${array[0]}"
content_response="${array[1]}"
remote_ip_response="${array[2]}"
remote_port_response="${array[3]}"
scheme_response="${array[4]}"
time_response="${array[5]}"

[[ -d ${server_name//[[:blank:]]/} ]] || mkdir ${server_name//[[:blank:]]/}
if [ $http_response == "200" ]; then
    echo $(date +"%Y-%m-%d %R")"|"${post_response} >> ${server_name//[[:blank:]]/}"/"$(date +"%Y-%m")".log"
else
    echo $(date +"%Y-%m-%d %R")"|"${post_response} >> ${server_name//[[:blank:]]/}"/"$(date +"%Y-%m")".log"
    # SHARE TO SLACK
    template='{
        "blocks": [
            {
                "type": "header",
                "text": {
                    "type": "plain_text",
                    "text": ":red_circle: '${server_name}' is Down!",
                    "emoji": true
                }
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*HTTP Status:*\nError '${http_response}'"
                    },
                    {
                        "type": "mrkdwn",
                        "text": "*Scheme:*\n'${scheme_response}'"
                    }
                ]
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*Remote IP:*\n'${remote_ip_response}':'${remote_port_response}'"
                    },
                    {
                        "type": "mrkdwn",
                        "text": "*Time Consume:*\n'${time_response}'"
                    }
                ]
            },
            {
                "type": "section",
                "fields": [
                    {
                        "type": "mrkdwn",
                        "text": "*Content Type:*\n'${content_response}'"
                    }
                ]
            },
            {
                "type": "section",
                "block_id": "section567",
                "text": {
                    "type": "mrkdwn",
                    "text": "<'${server_link}'|View Website> \n \n This downtime was recorded (for the monitor *'${server_name}'*) on *'$(date)'*."
                },
                "accessory": {
                    "type": "image",
                    "image_url": "https://cdn.dribbble.com/users/251873/screenshots/9288094/13539-sign-for-error-or-explanation-alert.gif",
                    "alt_text": "Super You"
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
    # REBUILD APP
    # e.g. 
    # bash deploy.sh
fi