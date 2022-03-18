CREATE INDEX USR_name_index -- Faster searches on "Search People" func
ON USR ("name");

CREATE INDEX MESSAGE_sendTime_index -- Better way to sort through timestamps efficiently
ON MESSAGE(sendTime);

CREATE INDEX MESSAGE_deleteStatus_index -- Check deletes faster
ON MESSAGE
USING hash(deleteStatus);