import serial
import enum

class tmtc_endpoint(int, enum):
    PF=0,
    SU=1,
    PU=2

class tmtc_frame:
    def __init__(self, route_src: int, route_dest: int, seq_id:int, svc_code: int, payload:bytes):
        self.payload = payload

    def get_length(self):
        return self.frame_length
    
    def get_payload(self):
        return self.payload

    def force_length(self, length:int, disable_crc_calculation:bool = False):
        """Force the frame length field to a specific value for error injection purposes."""
        self.frame_length = len(self.payload)
    
    def force_crc(self, crc:int):
        """Force the CRC field to a specific value for error injection purposes."""
        self.crc = crc

class tmtc_transaction:
    def __init__(self, command_frame:tmtc_frame):
        self.command_frame = command_frame

    def get_endpoint(self):
        return self.endpoint

    def get_frame(self):
        return self.frame

    def get_frame_length(self):
        return self.frame.get_frame_length()

    def get_frame_data(self):
        return self.frame.get_frame_data()

    def get_frame_data_length(self):
        return self.frame.get_frame_data_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_crc(self):
        return self.frame.get_frame_crc()

    def get_frame_crc_length(self):
        return self.frame.get_frame_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc(self):
        return self.frame.get_frame_data_crc()

    def get_frame_data_crc_length(self):
        return self.frame.get_frame_data_crc_length()

    def get_frame_data_crc


class tmtc_master:
    def __init__(self, port:str, baudrate:int, timeout:int):
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self.ser = serial.Serial(port, baudrate, timeout=timeout)
        self.ser.flushInput()
        self.ser.flushOutput()


