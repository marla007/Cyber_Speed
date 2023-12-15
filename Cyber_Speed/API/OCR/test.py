import requests
import base64
import json


def load_config(file_path):
    with open(file_path, 'r') as file:
        config_data = json.load(file)
    return config_data


def make_request(config_data):
    # Extract information from the config file
    domain = config_data["request"]["domain"]
    endpoint = config_data["request"]["endpoint"]
    headers = config_data["request"]["headers"]
    image_data = config_data["request"]["image"]

    # Make sure to decode the base64 image string
    image = base64.b64decode(image_data)

    # Make the API request
    response_data = requests.post(domain + endpoint, headers=headers, data=image)

    return response_data


def check_response(response_data, expected_response):
    try:
        # Attempt to parse the response as JSON
        json_response = response_data.json()
    except requests.exceptions.JSONDecodeError:
        print("Error: Response is not in JSON format.")
        return False

    # Check if the response has the expected status
    if json_response["status"] == expected_response["status"]:
        # Check if the response has the expected keys and their values are strings
        for key, value_type in expected_response.items():
            if key != "status" and key in json_response:
                if not isinstance(json_response[key], str):
                    print(f"Error: {key} is not a string in the response.")
                    return False
            else:
                print(f"Error: {key} not found in the response.")
                return False

        return True
    else:
        print(f"Error: Unexpected status in the response - {json_response['status']}.")
        return False


# Example usage with the provided configuration file
config_file_path = 'config.json'
config = load_config(config_file_path)

response = make_request(config)
if check_response(response, config["expected_response"]):
    print("Response is as expected.")
else:
    print("Response is not as expected.")
