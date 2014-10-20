# Kenobi

Kenobi detects forced pushes on GitHub repos and alerts you about them.


# Notifiers

Several different notifiers can be used to alert you that a force push has been detected. Configure them by setting the required environment variables.

## Slack

Post the details of the force push to a Slack channel.

| Name            | Purpose                                         | Required? |
| --------------- | ----------------------------------------------- | --------- |
| `SLACK_TEAM`    | Your Slack team name.                           | Required  |
| `SLACK_TOKEN`   | Your Slack API token.                           | Required  |
| `SLACK_CHANNEL` | The channel where the details should be posted. | Optional  |

If no channel is provided, the channel specified when setting up the integration will be used.
