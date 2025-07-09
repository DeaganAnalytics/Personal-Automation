import xml.etree.ElementTree as ET
import csv

def xml_to_csv(xml_file, csv_file):
    # Parse the XML file
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Open the CSV file for writing
    with open(csv_file, mode='w', newline='') as file:
        writer = csv.writer(file)

        # Get the headers from the XML
        headers = [elem.tag for elem in root[0]]
        writer.writerow(headers)

        # Write the data
        for child in root:
            row = [elem.text for elem in child]
            writer.writerow(row)

# Example usage
xml_file = 'C:/Users/seamus.deagan/Desktop/Test folder/input.xml'  # Replace with your XML file path
csv_file = 'C:/Users/seamus.deagan/Desktop/Test folder/output2.csv'  # Replace with your desired CSV file path
xml_to_csv(xml_file, csv_file)
