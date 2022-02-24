PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES DOS;

FUNCTION findCharPositionAfter(Ch: CHAR; Pos: INTEGER; Str: STRING): INTEGER;
VAR
  CurPosition: INTEGER;
BEGIN {findCharPositionAfter}
    CurPosition := Pos + 1;
    WHILE (Str[CurPosition] <> Ch) AND (LENGTH(Str) >= CurPosition)
    DO
      CurPosition := CurPosition + 1;
    findCharPositionAfter := CurPosition;
END; {findCharPositionAfter}

FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString: STRING;
  StartPos: BYTE;
BEGIN {GetQueryStringParameter}
  QueryString := GetEnv('QUERY_STRING');
  StartPos := POS(Key, QueryString);
  GetQueryStringParameter := '';
  IF StartPos > 0
  THEN
    BEGIN
      StartPos := LENGTH(Key) + StartPos + 1;
      GetQueryStringParameter := COPY(QueryString, StartPos, findCharPositionAfter('&', StartPos, QueryString) - StartPos)
    END
END; {GetQueryStringParameter}

BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;

  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}
