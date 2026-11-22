import argparse
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

def main():
    parser = argparse.ArgumentParser(description="Convert a flat XML table to CSV.")
    parser.add_argument("input", help="XML file to read")
    parser.add_argument("output", help="CSV file to write")
    args = parser.parse_args()
    xml_to_csv(args.input, args.output)


if __name__ == "__main__":
    main()
