import re
import argparse
def extract_assert_properties(verilog_file, output_file):
    # Compile a regular expression to match the specific assert property lines
    pattern = re.compile(r'assert property \(\w+\[(\d+)\]==0\);')

    # Initialize a list to hold the extracted properties
    properties = []

    # Read the Verilog file and extract all matching lines
    with open(verilog_file, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                properties.append(match.group(1))  # Only store the index number
    print(properties)
    # Write the extracted properties to the output file in the specified format
    with open(output_file, 'w') as file:
        for idx, prop in enumerate(properties):
            file.write(f"{idx} {prop}\n")

def extract_bad_lines(file_path):
    """ Extract line numbers from the bad event file where 'bad' events occur, using the end line number. """
    bad_lines = []
    with open(file_path, "r") as file:
        lines = file.readlines()
        for line in lines:
            if 'bad' in line:
                # This regex now captures the end line number in the range
                match = re.search(r'(\w+\.v):\d+\.\d+-(\d+)\.\d+', line)
                assert (match)
                if match:
                    bad_lines.append(int(match.group(2)))  # Use the end line number
    return bad_lines

def correlate_bad_events_to_file(bad_lines, verilog_file_path, output_file_path):
    """ Read specific lines from the Verilog file, extract coverage indices, and write to an output file. """
    with open(verilog_file_path, "r") as file:
        verilog_lines = file.readlines()
    
    with open(output_file_path, "w") as output_file:
        for i, line_no in enumerate(bad_lines):
            print(i,line_no)
            verilog_line = verilog_lines[line_no - 1]  # Adjusting because list index starts at 0
            match = re.search(r'assert property \(coverage0\[(\d+)\]==0\);', verilog_line)
            assert (match)
            if match:
                coverage_number = match.group(1)
                # output_file.write(f"Bad event {i + 1} correlates with coverage number {coverage_number} in line {line_no}\n")
                output_file.write(f"{i} {coverage_number}\n")


cmd_opt = argparse.ArgumentParser(description='Argparser')
cmd_opt.add_argument('-verilog_file', default=None, help='The target Verilog file')
cmd_opt.add_argument('-btor_file', default=None, help='The target Btor file')
cmd_opt.add_argument('-output_idx', default=None, help='the output file')
cmd_args, _ = cmd_opt.parse_known_args()
# Usage example:

bad_lines = extract_bad_lines(cmd_args.btor_file)
correlate_bad_events_to_file(bad_lines, cmd_args.verilog_file, cmd_args.output_idx)