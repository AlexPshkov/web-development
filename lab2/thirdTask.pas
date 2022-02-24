PROGRAM ThirdTask(INPUT, OUTPUT);
USES DOS;

FUNCTION GetParameterValue(ParameterName: STRING): STRING;
VAR
  QueryString: STRING;
  StartPos, EndPos: BYTE;
BEGIN
  QueryString := GetEnv('QUERY_STRING');
  StartPos := POS('=', QueryString) + 1;
  EndPos :=  POS('&', QueryString); 

  IF EndPos > 0
  THEN
    GetParameterValue := COPY(QueryString, StartPos, EndPos - StartPos)
  ELSE
    GetParameterValue := COPY(QueryString, StartPos, LENGTH(QueryString))
END; 

FUNCTION IsSuchParameterValue(ParameterName: STRING): BOOLEAN;
BEGIN
  IF POS(ParameterName, GetEnv('QUERY_STRING')) > 0
  THEN 
     IsSuchParameterValue := true
  ELSE
    IsSuchParameterValue := false
END;

BEGIN {Third task}
  WRITELN('Content-Type: text/plain');
  WRITELN;

  IF IsSuchParameterValue('name')
  THEN 
    WRITELN('Hello dear, ', GetParameterValue('name'), '!')
  ELSE
    WRITELN('Hello Anonymous!')
END. {Third task}
