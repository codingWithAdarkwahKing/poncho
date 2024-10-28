#!/bin/bash

if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Define the endpoint URL
URL="http://kingasare.chickenkiller.com"
# Define the email and password for authentication
EMAIL=$DJANGO_SUPERUSER_EMAIL
PASSWORD=$DJANGO_SUPERUSER_PASSWORD

# Initialize counters for passes and failures
passes=0
failures=0

# Function to handle steps and update counters
handle_step() {
    local response_code=$1
    local step_name=$2
    if [ $response_code -eq 200 ] || [ $response_code -eq 302 ] || [ $response_code -eq 201 ] || [ $response_code -eq 204 ]; then
        echo "$step_name successful! Response code: $response_code"
        ((passes++))
    else
        echo "$step_name failed. Response code: $response_code"
        ((failures++))
    fi
}

# Perform the HTTP request using curl
RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST -F "email=$EMAIL" -F "password=$PASSWORD" $URL/accounts/login/)

# Check the response code for authentication
handle_step $RESPONSE_CODE "Authentication"
        echo "Constructed URL for workout API: $URL/api/workout/"


if [ $RESPONSE_CODE -eq 200 ] || [ $RESPONSE_CODE -eq 302 ]; then
    # Create operation
    INSERTION_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d '{"name": "Example Workout", "height": 180, "workout_type": "Strength", "repetitions": 10}' $URL/api/workout/)
    handle_step $INSERTION_RESPONSE "Data insertion"

    if [ $INSERTION_RESPONSE -eq 201 ]; then
        # Read operation
        # echo "Data insertion successful! Response code: $INSERTION_RESPONSE"
        WORKOUT_DETAILS=$(curl -s -w "%{http_code}" -o /dev/null $URL/api/workout/1/)
        handle_step $WORKOUT_DETAILS "Read operation"

        # Update operation
        UPDATE_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X PUT -H "Content-Type: application/json" -d '{"name": "Updated Workout", "height": 175, "workout_type": "Cardio", "repetitions": 20}' $URL/api/workout/1/)
        handle_step $UPDATE_RESPONSE "Update operation"

        # Delete operation
        DELETE_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE $URL/api/workout/1/)
        handle_step $DELETE_RESPONSE "Delete operation"

        # Verification after deletion
        VERIFY_RESPONSE=$(curl -s -w "%{http_code}" -o /dev/null $URL/api/workout/1/)
        if [ $VERIFY_RESPONSE -eq 404 ]; then
            echo "Verification after deletion passed!!"
        else
            handle_step $VERIFY_RESPONSE "Verification after deletion"
        fi
    fi
fi

# Print summary
echo "End-to-end test completed:"
echo "Passes: $passes"
echo "Failures: $failures"

# Exit with appropriate status
if [ $failures -gt 0 ]; then
    exit 1
else
    exit 0
fi
