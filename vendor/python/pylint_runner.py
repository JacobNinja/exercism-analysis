import sys, os, json
sys.path += os.getcwd()

from pylint import lint
from pylint.reporters import BaseReporter, Message

class ExercismReporter(BaseReporter):
    """Reports messages as JSON"""

    messages = []

    def __init__(self, output=None):
        BaseReporter.__init__(self, output)

    def add_message(self, msg_id, location, msg):
        abspath, module, obj, line, column = location
        self.messages.append({'line': line, 'column': column, 'message': msg})

    def _display(self, layout):
        print json.dumps(self.messages)

lint.Run(sys.argv[1:], reporter=ExercismReporter())
