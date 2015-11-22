# This project is obsolete

You should just use a [protected branch](https://help.github.com/articles/configuring-protected-branches/) instead.

---


# Kenobi

Kenobi detects forced pushes on GitHub repos and alerts you about them.


# Configuration

By default, all branches will be checked. If you only care about particular branches, set a comma separated list of them in the `BRANCHES` environment variable.


# Notifiers

Several different notifiers can be used to alert you that a force push has been detected. Configure them by setting the required environment variables.

## Slack

Post the details of the force push to Slack.

| Name                | Purpose                       | Required? |
| ------------------- | ----------------------------- | --------- |
| `SLACK_WEBHOOK_URL` | The Slack webhook URL to use. | Required  |


## PagerDuty

Trigger an incident in PagerDuty when a force push occurs.

| Name                    | Purpose                               | Required? |
| ----------------------- | ------------------------------------- | --------- |
| `PAGERDUTY_SERVICE_KEY` | The PagerDuty service API key to use. | Required  |
