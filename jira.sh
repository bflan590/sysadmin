curl --request POST \
  --user <email>:<apitoken> \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '
    {
      "name": "Thomas Anderson",
      "password": "Test1234!",
      "emailAddress": "ttest@invaluable.com",
      "displayName": "JIRA-TEST-AUTOMATION"
    }' \
  --url '<api endpoint>'
