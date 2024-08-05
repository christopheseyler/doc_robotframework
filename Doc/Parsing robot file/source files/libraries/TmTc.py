from enum import Enum


class TmTcEndpoint(int, Enum):
    PF = 0
    SU = 1
    PU = 2

    

class tmtc_transaction:
    def __init__(self, Source: TmTcEndpoint, destination, TmTcEndpoint, SvcId:int,  data:bytes):
        self.source = Source
        self.destination = destination
        self.SvcId = SvcId
        self.data = data

class TmTc:
    def __init__(self, port):
        self.port = port

    def send_command(self, command:tmtc_transaction):
        pass

    