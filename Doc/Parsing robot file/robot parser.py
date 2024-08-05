from robot.parsing.model import TestCaseFile
from robot.parsing.populators import FromFilePopulator

def parse_robot_file(file_path):
	# Parse the Robot Framework file
	suite = TestCaseFile(source=file_path)
	FromFilePopulator(suite).populate()

	# Print settings section documentation
	print("Settings Documentation:")
	for setting in suite.setting_table:
		if setting.name == 'Documentation':
			print(setting.value)

	# Print test cases information
	print("\nTest Cases Information:")
	for test in suite.testcase_table:
		print(f"Test Case: {test.name}")
		print(f"  Documentation: {test.doc.value}")
		print(f"  Tags: {', '.join(test.tags.value)}")
		print("  Keywords:")
		for step in test.steps:
			print(f"    {step.name} {' '.join(step.args)}")

# Example usage
file_path = "Doc/Parsing robot file/source files/test.robot"
parse_robot_file(file_path)