# Kenobi

Kenobi detects forced pushes on GitHub repos and alerts you about them.


# Configuration

By default, all branches will be checked. If you only care about particular branches, set a comma separated list of them in the `BRANCHES` environment variable.


# Notifiers

Several different notifiers can be used to alert you that a force push has been detected. Configure them by setting the required environment variables.

## Slack

Post the details of the force push to Slack.

| Name            | Purpose               | Required? |
| --------------- | --------------------- | --------- |
| `SLACK_TEAM`    | Your Slack team name. | Required  |
| `SLACK_TOKEN`   | Your Slack API token. | Required  |


## PagerDuty

Trigger an incident in PagerDuty when a force push occurs.

| Name                    | Purpose                               | Required? |
| ----------------------- | ------------------------------------- | --------- |
| `PAGERDUTY_SERVICE_KEY` | The PagerDuty service API key to use. | Required  |
