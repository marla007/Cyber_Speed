# MyLib.py
from robot.libraries.BuiltIn import BuiltIn
from datetime import datetime
import re

selenium2lib = BuiltIn().get_library_instance("Selenium2Library")
wait_short = BuiltIn().get_variable_value("${WAIT_SHORT}")
wait_middle = BuiltIn().get_variable_value("${WAIT_MIDDLE}")


# Convert dates to the m/d/y format
def format_dates(date_strings):
    formatted_dates = []
    for input_date_string in date_strings:
        try:
            # Parse each input date string
            parsed_date = datetime.strptime(input_date_string, "%b %d, %Y")
            # Format the parsed date as MM/DD/YYYY
            formatted_date = parsed_date.strftime("%m/%d/%Y")
            formatted_dates.append(formatted_date)
        except ValueError:
            # Handle invalid date strings if needed
            formatted_dates.append(None)
    return formatted_dates


# Compare and check sorting validation
def is_sorted_by_publication_date(date_strings):
    def convert_to_datetime(date_str):
        return datetime.strptime(date_str, "%m/%d/%Y")

    # Convert date strings to datetime objects
    dates = [convert_to_datetime(date) for date in date_strings]

    # Check if the dates are in ascending order
    return all(date1 >= date2 for date1, date2 in zip(dates, dates[1:]))


# Get Items count and if it's bigger, than 16, it must have pagination
def extract_and_compare(text):
    # Use regular expression to find the number after the word "over"
    match = re.search(r'over (\d+),?(\d*)', text)
    # Check if a match is found
    if match:
        # Extract the matched number
        number = int(match.group(1) + match.group(2))
        # Check if the number is greater than 16
        if number > 16:
            return True
        else:
            return False
    else:
        # If no match is found, return False
        return False


# Return sorting results
def check_and_print_sorting(date_list):
    sorted_result = is_sorted_by_publication_date(date_list)

    if sorted_result:
        return "The list is sorted by publication date."
    else:
        return "The list is not sorted by publication date."


# Input email
def input_email(username):
    username_input = BuiltIn().get_variable_value("${USERNAME_INPUT}")
    selenium2lib.wait_until_element_is_enabled(username_input, wait_short)
    selenium2lib.clear_element_text(username_input)
    selenium2lib.input_text(username_input, username)


# Input password
def input_password(password):
    password_input = BuiltIn().get_variable_value("${PASSWORD_INPUT}")
    selenium2lib.wait_until_element_is_enabled(password_input, wait_short)
    selenium2lib.clear_element_text(password_input)
    selenium2lib.input_text(password_input, password)


# Click on the Continue button
def click_continue():
    btn_continue = BuiltIn().get_variable_value("${CONTINUE}")
    selenium2lib.wait_until_element_is_visible(btn_continue, wait_short)
    selenium2lib.click_button(btn_continue)


# Submit sing in
def click_sign_in():
    btn_sign_in = BuiltIn().get_variable_value("${SIGN_IN}")
    selenium2lib.wait_until_element_is_visible(btn_sign_in, wait_short)
    selenium2lib.click_button(btn_sign_in)
