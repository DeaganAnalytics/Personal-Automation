from datetime import datetime
import win32com.client

# Manually specify the year
specified_year = 2025  # Change this to the desired year

def get_sa_public_holidays(year):
    """
    Return a list of public holidays in South Australia for a given year. Update the dates each year.
    """
    holidays = [
        {'date': datetime(year, 1, 1), 'name': "New Year's Day"},
        {'date': datetime(year, 1, 27), 'name': "Australia Day Holiday"},
        {'date': datetime(year, 3, 10), 'name': "Adelaide Cup Day"},
        {'date': datetime(year, 4, 18), 'name': "Good Friday"},
        {'date': datetime(year, 4, 21), 'name': "Easter Monday"},
        {'date': datetime(year, 4, 25), 'name': "ANZAC Day"},
        {'date': datetime(year, 6, 9), 'name': "King's Birthday"},
        {'date': datetime(year, 10, 6), 'name': "Labour Day"},
        {'date': datetime(year, 12, 25), 'name': "Christmas Day"},
        {'date': datetime(year, 12, 26), 'name': "Boxing Day"},
    ]
    return holidays

# Create an instance of Outlook application
outlook = win32com.client.Dispatch("Outlook.Application")

# Function to create an all-day appointment
def create_appointment(subject, start_date, category=None):
    # Create a new appointment item
    appointment = outlook.CreateItem(1)  # 1 represents AppointmentItem

    # Set the start date of the appointment as an all-day event
    appointment.Start = start_date.strftime("%Y-%m-%d")
    appointment.AllDayEvent = True

    # Set subject of the appointment
    appointment.Subject = subject

    # Set the availability status of the appointment as "Out of Office"
    appointment.BusyStatus = 3  # 3 represents "Out of Office"

    # Assign a category if specified
    if category:
        appointment.Categories = category

    # Save the appointment
    appointment.Save()

    # Print a confirmation message
    print(f"All-day appointment for '{subject}' on {start_date.strftime('%A, %Y-%m-%d')} created successfully!")

# Get the public holidays for the specified year
public_holidays = get_sa_public_holidays(specified_year)

# Specify the category for the public holidays (optional)
holiday_category = None  # Replace with your desired Outlook category name (leave as None to skip)

# Create all-day appointments for each public holiday
for holiday in public_holidays:
    create_appointment(holiday['name'], holiday['date'], holiday_category if holiday_category else None)
