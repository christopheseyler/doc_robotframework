import ast
import astpretty
from robot.api.parsing import get_model, ModelVisitor



class SettingsPrinter(ModelVisitor):
    def __init__(self):
        self.firstMetadata = True

    def visit_Documentation(self, node):
        print(f"- Suite Doc :\n{node.value} (on line {node.lineno})")
        self.generic_visit(node)


    def visit_Metadata(self, node):

        if self.firstMetadata:
            print("- Metadata:")
            self.firstMetadata = False

        print(f"  * {node.name}:{node.value}")


class SuiteSetupPrinter(ModelVisitor):
    def visit_SuiteSetup(self, node):
        print(f"- Suite Setup: {node.name} (on line {node.lineno})")
        
        


class TestCasesPrinter(ModelVisitor):
    def visit_TestCaseName(self, node):
        print(f"- Test: {node.name} (on line {node.lineno})")
        self.generic_visit(node)

    def visit_Documentation(self, node):
        print(f"- Test Doc :\n{node.value} (on line {node.lineno})")
        print( "- Test Procedure :\n")
        #self.generic_visit(node)

    def visit_KeywordCall(self, node):
        print(f"     {node.keyword}")
        #self.generic_visit(node)
        



class RobotFilePrinter(ModelVisitor):

    def visit_File(self, node):
        print(f"File '{node.source}' has the following tests:")
        self.generic_visit(node)

    def visit_TestCase(self, node):
        TestCasesPrinter().visit(node)
  
    def visit_SettingSection(self, node):
        SettingsPrinter().visit(node)
        SuiteSetupPrinter().visit(node)


def parse_robot_file(file_path):
    model = get_model(file_path)
    #print(ast.dump(model, include_attributes=True))
    #print('-' * 72)
    #astpretty.pprint(model)

    printer = RobotFilePrinter()
    printer.visit(model)



if __name__ == '__main__':
    parse_robot_file("Doc/Parsing robot file/source files/test.robot")


