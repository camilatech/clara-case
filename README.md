# dbt Project for GitHub Event Analysis

## Overview
This dbt project is designed to analyze GitHub event data over a one-hour period. The primary objective is to generate reports focusing on the most active users and repositories based on various metrics like pull requests, commits, and watch events.

The project is structured using dbt for transformation and modeling of the raw data, which is categorized into four primary files: `Events`, `Actors`, `Commits`, and `Repos`.

## Prerequisites
- dbt installed and configured
- Access to the relevant GitHub event data

## Repository Structure
- `models/`: Contains SQL files for dbt models
- `tests/`: Contains test files for validating the models
- `dbt_project.yml`: The main project configuration file

## Setting Up the Python Environment

### Creating a Python Virtual Environment
To isolate our project dependencies, we'll use a virtual environment. Follow these steps to create and activate a virtual environment:

1. **Install Python**: Ensure that Python is installed on your system. You can download it from [python.org](https://www.python.org/).

2. **Create a Virtual Environment**:
   - Navigate to your project directory in the terminal.
   - Run `python -m venv venv` to create a virtual environment named `venv`.
   - This will create a `venv` directory in your project folder.

3. **Activate the Virtual Environment**:
   - On Windows, run `venv\Scripts\activate`.
   - On MacOS or Linux, run `source venv/bin/activate`.
   - Once activated, your terminal prompt should change to indicate that the virtual environment is active.

### Installing Dependencies
After activating the virtual environment, install the project dependencies:

1. Ensure you have a file named `requirements.txt` in your project directory.

2. Run `pip install -r requirements.txt` to install the required Python packages.

### Setting Up Environment Variables
To manage configuration and sensitive data, use environment variables:

1. Create a file named `.env` in your project root based on the `example.env` template.

2. Fill in the required environment variables in the `.env` file. This might include database credentials, API keys, etc.

3. Source the Environment Variables:
   - Before running your dbt or Python commands, load the variables into your environment.
   - In the terminal, navigate to your project directory.
   - Run `source .env` to export the variables from `.env` to your shell session.
   - Note: This command needs to be run in every new terminal session before running your project scripts.

### Deactivating Environment Variables
- To clear the environment variables from the current session, you can close the terminal session or manually unset each variable.

## Git Flow Procedures
1. **Initialization**: Clone the repository to start working on the project.
2. **Feature Branch**: Create a new branch for each feature or task. For instance, `feature/top_active_users`.
3. **Development**: Work on your feature in the created branch.
4. **Testing**: Write and run tests for your models using dbt.
5. **Committing**: Commit your changes with clear, descriptive messages.
6. **Pull Request**: Once the feature is ready and tested, create a pull request against the main branch.
7. **Code Review**: Have your code reviewed by a peer or a supervisor.
8. **Merge**: After approval, merge the feature branch into the main branch.

## Basic DBT Commands
- `dbt run`: Runs your dbt models
- `dbt test`: Runs tests defined in your dbt project
- `dbt compile`: Generates the compiled SQL code for your models
- `dbt docs generate`: Generates documentation for your project
- `dbt docs serve`: Serves the generated documentation on a local server

## Data Modeling
### Thought Process
1. **Source Data Analysis**: Understand the structure and contents of the `Events`, `Actors`, `Commits`, and `Repos` data.
2. **Creation of Tables**: Create tables to padronize and clean the data, also helping in the discovery part.
3. **Final Report Tables**: Develop models for the final report, focusing on the top 10 active users, top 10 repositories by commits, and top 10 repositories by watch events.

### Diagrams
[Include diagrams of your data model here]

## DBT Testing
- Basic tests include checking for null values, unique constraints, and referential integrity.
- Custom tests can be written for specific business logic.

## Additional Information
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
