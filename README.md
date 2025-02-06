# GitHub Actions Demo

A project to demonstrate how the GitHub actions can be used for CI/CD. This app has the following setup:
* An iOS project for a framework
* An iOS project to test the framework
* A shell script to generate the framework
* A workspace to contain all the above files

The actions are setup to trigger whenever a new version tag is pushed to remote. The workflow will generate the `xcframework` file and then test it's integration with the demo project.
As the output the workflow will create a Release for the version in GitHub and attach the `xcframework` zip.

Check the [Wiki](https://github.com/ayush-ttn/githubAction/wiki) to see how it all works
