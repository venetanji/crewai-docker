FROM python:3.12.9-bookworm

ENV APP_NAME=my_app

RUN pip install crewai[tools]

# Run the crewai create flow command during the build process
RUN crewai create flow $APP_NAME

# Set the CMD to run crewai flow kickoff inside the APP_NAME folder
CMD ["sh", "-c", "cd $APP_NAME && crewai flow kickoff"]