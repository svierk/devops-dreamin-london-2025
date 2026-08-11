# 🌇 DevOps Dreamin' London 2025 - Demo

[![Validation](https://github.com/svierk/devops-dreamin-london-2025/actions/workflows/ci.yml/badge.svg?branch=main&event=push)](https://github.com/svierk/devops-dreamin-london-2025/actions/workflows/ci.yml)

## Scratch Org Self-Service with GitHub Actions

This repository serves as the basis for a demo during the DevOps Dreamin' London 2025 and can also be used as a blueprint for implementing a Salesforce self-service for automated Scratch Org creation.

### Purpose of the Scratch Org Self-Service

One of the biggest challenges in implementing modern DevOps practices in the Salesforce ecosystem is the cross-functional nature of the related teams with varying levels of technical expertise in this area. To be able to still make DevOps a shared responsibility of a team, it's crucial to make all the associated tools and concepts as accessible as possible for everyone. Especially when using Scratch Orgs, challenges often arise, as their creation typically requires the use of tools like VS Code and the Salesforce CLI. Therefore, a self-service concept can increase accessibility.

### How the Scratch Org Self-Service works

You can find the [Self-Service in the Actions tab of this repo](https://github.com/svierk/devops-dreamin-london-2025/actions/workflows/create-scratch-org.yml) which allows you to request a new Scratch Org by entering simple parameters as configuration via the following form:

<img src="./self-service.png" alt="preview" width="300">

The implementation in the associated [create-scratch-org.yml](https://github.com/svierk/devops-dreamin-london-2025/blob/main/.github/workflows/create-scratch-org.yml) file is located in the `.github` directory under `workflows`. This includes the definition of necessary process steps such as authorizing the DevHub, creating the org, installing packages, and provisioning test data.

### GitHub Actions that simplify building your Salesforce DevOps Setup

Below you will find a number of freely usable actions I created to simplify the process of building individual DevOps setups using GitHub Actions. Essentially, they are like building blocks that abstract away the complexity of the Salesforce CLI and serve different purposes. They were also used in the Scratch Org Self-Service in this repository:

| Action                                                                              | Purpose                                                    | Version pinned here |
| ----------------------------------------------------------------------------------- | ---------------------------------------------------------- | ------------------- |
| [🕵🏻 Get Node Version](https://github.com/svierk/get-node-version)                   | Resolve and set up the Node.js version from `package.json` | `v1.5.1`            |
| [⚙️ SFDX CLI Setup](https://github.com/svierk/sfdx-cli-setup)                       | Install the Salesforce CLI and related plugins             | `v1.1.2`            |
| [🔐 SFDX Login](https://github.com/svierk/sfdx-login)                               | Authenticate against a Salesforce org via the JWT flow     | `v1.4.2`            |
| [🌩️ SFDX Create Scratch Org](https://github.com/svierk/sfdx-create-scratch-org)     | Create a scratch org from a definition file                | `v1.3.1`            |
| [📦 SFDX Package Installation](https://github.com/svierk/sfdx-package-installation) | Install dependency packages into the target org            | `v1.2.1`            |
| [🚀 SFDX Deploy](https://github.com/svierk/sfdx-deploy)                             | Deploy or validate metadata against the target org         | `v1.2.1`            |
| [💾 SFDX Data Import](https://github.com/svierk/sfdx-data-import)                   | Import CSV or sObject Tree JSON sample data                | `v1.3.1`            |
| [✅ SFDX Run Tests](https://github.com/svierk/sfdx-run-tests)                       | Run Apex, LWC and Flow tests with coverage reporting       | `v1.1.0`            |

### Versioning and secrets in the workflows

A few conventions the workflows in this repository follow - worth copying into your own setup:

- **Every `uses:` reference is pinned to an exact release tag** (`@v1.4.2`), never to a moving ref such as `@main` or `@v1`. A pinned tag makes every upgrade an explicit, reviewable change instead of something that silently swaps under a running pipeline. [Dependabot](.github/dependabot.yml) watches the `github-actions` ecosystem and opens the bump PRs, which are merged automatically once the required checks are green.
- **Credentials only ever travel through `secrets` and `vars`**, and are handed to an action as inputs or exposed to a `run:` step through `env:` - never interpolated into a shell command body, where a value could be read as script.
- **Each workflow declares least-privilege `permissions`**, and `actions/checkout` runs with `persist-credentials: false` so the `GITHUB_TOKEN` is not left behind in `.git/config` for later steps.

A minimal example of a pinned step using the JWT flow secrets of this repository:

```yaml
- name: Checkout
  uses: actions/checkout@v7.0.1
  with:
    persist-credentials: false

- name: Install SF CLI
  uses: svierk/sfdx-cli-setup@v1.1.2

- name: Salesforce Org Login
  uses: svierk/sfdx-login@v1.4.2
  with:
    client-id: ${{ secrets.SFDX_CONSUMER_KEY }}
    jwt-secret-key: ${{ secrets.SFDX_JWT_SECRET_KEY }}
    username: ${{ vars.SFDX_USERNAME }}
```
