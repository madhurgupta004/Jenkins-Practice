import argparse
import os

def process_file(file_path):
    # Check if the file exists
    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' not found.")
        return

    # Read the file content
    with open(file_path, 'r') as f:
        content = f.read().strip()  # Remove leading/trailing whitespace

    # Check if content is empty
    if not content:
        print("File is empty. Performing empty-file action.")
        # Example action for empty file
        # (Replace with your logic, e.g., exit with a specific code)
        exit(1)
    else:
        print("File is non-empty. Performing non-empty action.")
        print(f"File content: {content}")
        # Example action for non-empty file
        # (Replace with your logic, e.g., process the content)
        # For demo, we'll just echo it back

def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description="Process a file from Jenkins.")
    parser.add_argument('--file', required=True, help="Path to the input file")
    args = parser.parse_args()

    # Process the file
    process_file(args.file)

if __name__ == "__main__":
    main()