# dbt Project for GitHub Event Analysis

## Overview
This project employs dbt to analyze GitHub event data over a one-hour timeframe. Our goal is to generate insightful reports highlighting the most active users and repositories. These reports are based on key metrics such as pull requests, commits, and watch events.

The project leverages dbt for efficient transformation and modeling of raw data, organized into four main entities: `Events`, `Actors`, `Commits`, and `Repos`. BigQuery was chosen as the primary resource due to limitations in using a Personal Token with Databricks Community Edition. The project structure mirrors what would be used in Databricks, akin to the Medallion Architecture, but adapted for a dbt environment.

## Data Modeling
### Thought Process
1. **Source Data Analysis**: Initially, we delve into the structure and content of the `Events`, `Actors`, `Commits`, and `Repos` datasets.
2. **Creation of Staging Tables**: These tables are designed to standardize and cleanse the data, aiding in preliminary analysis and data discovery.
3. **Core Tables Design**: Given the business-centric nature of this analysis, a one-big-table approach was chosen over a star-schema. This decision is context-dependent and might differ in real-world applications. The data is segmented into two primary tables: `repo_activity` and `user_activity`, focusing on repository and user-centric activities, respectively.
4. **Final Report Tables**: Models for the final reports are crafted to spotlight the top 10 active users, repositories by commits, and repositories by watch events. While such metrics are typically derived through visualization tools like Power BI, they are included in this project as models and CSV outputs for comprehensive demonstration purposes.

### Diagrams
[Include diagrams of your data model here]

## DBT Testing
- Basic tests include checking for null values, unique constraints, and referential integrity.

## Repository Structure
- `report_indicators/`: Contains the csv outputs of the indicators
- `models/`: Contains SQL files for dbt models
- `models/staging`: Contains bronze models with minimal transformation to ensure a pattern
- `models/marts/core`: Contains Core Tables Used in withdrawing information
- `models/marts/report`: Contains Tables with the final Indicators
- `dbt_project.yml`: The main project configuration file
- `profiles.yml`: The main profile configuration file

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

Environment variables are crucial for managing configuration and sensitive data securely. Follow these steps to set up your environment:

1. **Initialize Environment File**:
   - Create a `.env` file at the root of your project. Use the provided `example.env` as a template.

2. **Configure Environment Variables**:
   - Update the `.env` file with the necessary environment variables.
   - Essential variables include `DEV_DATASET` and `DEV_KEYFILE` for the development dbt target:
     - `DEV_DATASET`: This should be in the format `dev_<your_name>_<your_lastname>`, e.g., `dev_camila_custodio`. It represents your personal development schema.
     - `DEV_KEYFILE`: Specify the path to your service account key JSON file. You should have received this file via email. Note: This path is valid only after installing the [gcloud CLI](https://cloud.google.com/sdk/docs/install).

3. **Source the Environment Variables**:
   - To make these variables accessible in your development environment, you need to load them into your session.
   - Open the terminal and navigate to your project directory.
   - Execute `source .env` to export the variables from `.env` into your shell session.
   - Important: This step is required in every new terminal session before executing any dbt or Python scripts related to your project.

### Deactivating Environment Variables
- To clear the environment variables from the current session, you can close the terminal session or manually unset each variable.

## First dbt Commands

Once you have set up your `.env` file and activated the virtual environment, you are ready to begin using dbt commands. Here's a step-by-step guide to get started:

1. **Testing Connectivity with `dbt debug`**:
   - Begin with the `dbt debug` command.
   - This command checks if the connection to your database is correctly established and verifies that your environment is properly configured for subsequent dbt commands.

2. **Installing Dependencies with `dbt deps`**:
   - Next, execute `dbt deps`.
   - This command installs all the dbt packages required for your models. It's essential to ensure that all dependencies are in place before moving forward.

3. **Building Models with `dbt build`**:
   - Finally, run `dbt build`.
   - This command executes all your models and runs tests in the most efficient manner. 
   - Upon completion, your models will be deployed to your schema. You can then check the terminal output to confirm that all tests have been executed successfully and without errors.

By following these steps, you will set up your dbt environment and prepare it for more advanced operations. Happy data modeling!

### Basic DBT Commands
- `dbt run`: Runs your dbt models
- `dbt test`: Runs tests defined in your dbt project
- `dbt compile`: Generates the compiled SQL code for your models
- `dbt docs generate`: Generates documentation for your project
- `dbt docs serve`: Serves the generated documentation on a local server

## Git Flow Procedures
1. **Initialization**: Clone the repository to start working on the project.
2. **Feature Branch**: Create a new branch for each feature or task. For instance, `feature/top_active_users`.
3. **Development**: Work on your feature in the created branch.
4. **Testing**: Write and run tests for your models using dbt.
5. **Committing**: Commit your changes with clear, descriptive messages.
6. **Pull Request**: Once the feature is ready and tested, create a pull request against the main branch.
7. **Code Review**: Have your code reviewed by a peer or a supervisor.
8. **Merge**: After approval, merge the feature branch into the main branch.


## Additional Information
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
