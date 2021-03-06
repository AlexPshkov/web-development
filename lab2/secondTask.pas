PROGRAM SecondTask(INPUT, OUTPUT);
USES DOS;
VAR
  Lanterns: STRING;

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

BEGIN {Second task}
  WRITELN('Content-Type: text/plain');
  WRITELN;

  Lanterns := GetParameterValue('lanterns');

  IF Lanterns = '1'
  THEN 
    WRITELN('The British are coming by land.')
  ELSE IF Lanterns = '2'
    THEN 
      WRITELN('The British are coming by sea.') 
    ELSE
      WRITELN('Sarah didnt say')
END. {Second task}
