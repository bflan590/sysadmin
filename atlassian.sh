#Jira and Hipchat Provisioning 
#Add in your API key after your email address in --user below

JIRA_USER=
JIRA_TOKEN=
AUTH_TOKEN=

ECHO "Welcome to the JIRA User Creation Script"
ECHO "Please enter the user's Display Name"
read dname
ECHO "Please enter the user's User Name"
read name
ECHO "Please enter the user's Email"
read email
ECHO "Please enter the user's Password"
read password

curl --request POST \
  --user ""$JIRA_USER"":""$JIRA_TOKEN"" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '
    {
      "displayName": "'"$dname"'",
      "name": "'"$name"'",
      "password": "'"$password"'",
      "emailAddress": "'"$email"'"
    }' \
  --url 'https://<company>.atlassian.net/rest/api/2/user'

 curl --request POST \
  --user ""$JIRA_USER"":""$JIRA_TOKEN"" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '
    {
      "name": "'"$name"'"
    }' \
  --url 'https://<company>.atlassian.net/rest/api/2/group/user?groupname=Jira-Collaborators'

  curl --request POST \
  --user ""$JIRA_USER"":""$JIRA_TOKEN"" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '
    {
      "name": "'"$name"'"
    }' \
  --url 'https://<company>.atlassian.net/rest/api/2/group/user?groupname=jira-developers'

  curl --request POST \
  --user ""$JIRA_USER"":""$JIRA_TOKEN"" \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '
    {
      "name": "'"$name"'"
    }' \
  --url '<group API endpoint>'

  curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"name\": \"$dname\", \"email\": \"$email\", \"mention_name\": \"$name\", \"password\": \"$password\"}" \
     https://api.hipchat.com/v2/user?auth_token=$AUTH_TOKEN
