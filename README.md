# ☁️ Salesforce DX Project Starter Kit

![GitHub CI](https://github.com/svierk/sfdx-project-starter-kit/actions/workflows/ci.yml/badge.svg)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=svierk_sfdx-project-starter-kit&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=svierk_sfdx-project-starter-kit)
[![codecov](https://codecov.io/gh/svierk/sfdx-project-starter-kit/branch/main/graph/badge.svg?token=J09EQWRADE)](https://codecov.io/gh/svierk/sfdx-project-starter-kit)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fsvierk%2Fsfdx-project-starter-kit.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fsvierk%2Fsfdx-project-starter-kit?ref=badge_shield)

## About the project

The repository provides a template for Salesforce DX projects which includes an initial configuration of Prettier, Linter rules, git hooks and unit tests as well as useful VS Code settings.

## Prerequisites

To use this template, the [Node](https://nodejs.org/en/) version specified in the _package.json_ and the latest version of the [Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli) should already be installed.

## Getting started

To get the template up and running, you need to clone the repository and open it with VS Code, install all the recommended extensions and run the following command to install all required dependencies:

```
npm install
```

After that you need to authorize an org for which you want to develop. In VS Code this can be done by pressing **Command + Shift + P**, enter "sfdx", and select **SFDX: Authorize an Org**.

Alternatively you can also run the following command from the command line:

```
sf org login web
```

## Code scaffolding

To generate new components in VS Code, press **Command + Shift + P**, enter "sfdx create", and select what you want to create, e.g. **SFDX: Create Lightning Web Component**.

Alternatively you can also create all components from the command line, e.g.:

```
cd force-app/main/default/lwc
```

```
sf lightning generate component --type lwc -n helloWorld -d force-app/main/default/lwc
```

## Code quality

### Git hooks

The project includes client-side pre-commit git hooks using [husky](https://github.com/typicode/husky) and [lint-staged](https://github.com/okonet/lint-staged). After installing all project dependencies, Prettier, Linter and unit tests are automatically executed before each commit.

### Prettier

Run _Prettier_ to check all files for formatting issues:

```
npm run prettier
```

### Linter

#### Linting LWC

Run _ESLint_ to check for linting issues:

```
npm run lint
```

#### Linting Apex code

Use the recommended extension [Apex PMD](https://github.com/ChuckJonas/vscode-apex-pmd) to check manually for Apex linting issues.

## Unit tests

### Execute LWC unit tests with Jest

To execute all unit tests only once run:

```
npm run test:unit
```

To execute all unit tests in watch mode for development run:

```
npm run test:unit:watch
```

To execute all unit tests with generated code coverage run:

```
npm run test:unit:coverage
```

## Local development

Local Dev for Lightning Web Components lets you create and modify components leveraging a real-time browser preview: [Preview Components with Local Dev](https://developer.salesforce.com/docs/platform/lwc/guide/get-started-test-components.html)

## Debugging

To debug and troubleshoot Lightning Web Components, in addition to enabling [Debug Mode in Salesforce](https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.debug_mode_enable), you should also configure the following settings in [Chrome Dev Tools](https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.debug_dev_tools):

- Enable custom formatters under Settings --> Preferences
- User the Ignore List to ignore framework code while troubleshooting. Add the following two patterns under Settings --> Ignore List:
  - `/aura_prod.*.js$`
  - `/components/.*.js$`

## Read more about Salesforce DX development

- [Salesforce Development Model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models)
- [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm)
- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
