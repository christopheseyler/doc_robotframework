# Tags and metadata

## metadata

[Robotframework documentation about metadata](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#free-suite-metadata)

Robotframework supports metadata for test suites only. Metadata is a key-value pair that can be used to store additional information about the test case or test suite. 
The interest of metadata is these information are automatically added to the log report inthe `Suite` section.

Here is an example of metadata defined in a test suite:

```robotframework
*** Settings ***
Metadata        Version            2.0
Metadata        Robot Framework    http://robotframework.org
Metadata        Platform           ${PLATFORM}
Metadata        Longer Value
...             Longer metadata values can be split into multiple
...             rows. Also *simple* _formatting_ is supported.
```

Metadata can be accessed in the test suite using the keyword `Get Metadata`. Here is an example of how to access metadata in a test suite:

```robotframework
*** Test Cases ***
Example
    ${version}=    Get Metadata    Version
    Log    Version: ${version}
```

### Accessing the metadata from a test case

Metadata can be accessed from a test case by using a built-in variable. The following example shows how to create a keyword `Get Suite Metadata` and 
how to use it. 

```robotframework
*** Settings ***
Metadata        Version            2.0
Metadata        Robot Framework    http://robotframework.org
Metadata        Platform           ${PLATFORM}
Metadata        Longer Value
...             Longer metadata values can be split into multiple
...             rows. Also *simple* _formatting_ is supported.

*** Test Cases ***
Example
    ${version}=    Get Suite Metadata    Version
    Log    Version: ${version}

*** Keywords ***
Get Suite Metadata
    [Arguments]    ${key}
    ${value}=    Get Variable Value    ${SUITE METADATA}[${key}]
    RETURN    ${value}
```

## Defining metadata from the command line

Metadata can be defined from the command line using the `--metadata` option. Here is an example of how to define metadata from the command line:

```bash
robot --metadata "Additional Metadata:Metadata value" test_metadata_from_cli.robot
```

## Tags

Tags are the other waay to add metadata to test cases. They are used to categorize test cases for example to specific test cases or suite.
They can be defined at the test case level or at the suite level. If defined at suite level, they will be applied to all test cases in the suite.

The suite tags are defined in the `Settings` section of the test suite. Here is an example of how to define tags at the suite level:

```python
*** Settings ***
Tests TAgs    smoke    regression
```

The test case tags are defined in the `Test Cases` section of the test suite.


```python
*** Settings ***
Test Tags    TestCaseTag    # This tag will be applied to all test cases in the suite

*** Test Cases ***
Example
    [Tags]    smoke    regression
    Log    This is a test case with tags
```

### Tags as dictionnary

Tags can be accessed as a dictionnary in the test suite. Here is an example of how to access tags in a test suite taken from https://github.com/robotframework/robotframework/issues/2080 :


In TestMetadata.py:

```python
from robot.libraries.BuiltIn import BuiltIn

def get_test_metadata(name):
    tags = BuiltIn().get_variable_value('${TEST TAGS}')
    prefix = name.lower() + '='
    for tag in tags:
        if tag.lower().startswith(prefix):
            return tag[len(prefix):]
    raise ValueError("Metadata '%s' not found!" % name)
```

In TestMetadata.robot:

```python
*** Settings ***
Library    TestMetadata.py

*** Test Cases ***
Example
    [Tags]    id=42    category=foo
    ${id} =    Get Test Metadata    ID
    ${cat} =    Get Test Metadata    category
    Log Many    ${id}    ${cat}
```


