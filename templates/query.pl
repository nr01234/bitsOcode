sub v{
  return "SELECT PERSON.ID,
		 ORDER.DATE,
                 to_date('01/01/1960', 'mm/dd/yyyy') + (1/1000000/60/60/24)*ORDER.TIME,     
          FROM PERSON
		 JOIN ORDERS ON ORDERS.PID = PERSON.PID
		 LEFT JOIN APPT ON APPT.VISITID = REGEXP_SUBSTR(DOCUMENT.VISITID, '[0-9]+')
          WHERE ((ORDERS.ORDERTYPE = 'S') AND (ORDERS.STATUS = 'C'))
	         AND (TRUNC(to_date('01/01/1960', 'mm/dd/yyyy') + (1/1000000/60/60/24)*ORDERS.TIME) >= '$startDate'
	         AND (TRUNC(to_date('01/01/1960', 'mm/dd/yyyy') + (1/1000000/60/60/24)*ORDERS.TIME) <= '$endDate'))
		 AND NOT REGEXP_LIKE(ORDERS.CODE, '^\-')
		 AND ORDERS.CHANGE != '10' 
	  ORDER BY ORDERS.DATE, length(PERSON.ID), PERSON.ID
	 }";

my $query = v();
