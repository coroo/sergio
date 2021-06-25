<!-- ## SERGIO (Server Ping Monitoring) -->

<p align="center"><img src="/static/img/logo-001.gif" width="300"  style="margin-top:-60px;margin-bottom:-70px"></p>

Let’s face it—the Internet is a fragile thing. Stuff breaks every now and then. Sergio lets you know when it does and what happened exactly.

## About Sergio

Sergio is a list for server monitoring template to help you track any performance, availability and even automate rebuild your application.

## Quick Start

Create New Monitoring:
```bash
cp template/pingmonitoring.sh server-a.sh
code server-a.sh #VISUAL CODE
```

Setup you server Name & Link:
```bash
server_name="Production Google"
server_link="https://www.google.com/"
```

For using Slack API, you need to create an app with [this documentation](https://api.slack.com/apps?new_app=1)

After the installation you will get Webhook URLs for Your Workspace, add your Webhook:
```bash
webhook_url="https://hooks.slack.com/services/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"
```
<!-- Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library. -->

## Contributing

Thank you for considering contributing to the Sergio! The contribution guide can be found in the [Contributing documentation](/blob/main/contributing.md).

## License

The Sergio is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
