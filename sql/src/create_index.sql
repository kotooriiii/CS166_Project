CREATE INDEX USR_name_index -- Faster searches on "Search People" func
ON USR ("name");

CREATE INDEX MESSAGE_sendTime_index -- Better way to sort through timestamps efficiently and if in future we filter
ON MESSAGE(sendTime);