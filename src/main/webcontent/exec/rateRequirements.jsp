<%@ page import="java.util.Enumeration"%>
<%@ page import="edu.rit.se.creativecrowd.DBProcess"%>
<%
	String uid = session.getAttribute("userid").toString();
	String gid = session.getAttribute("groupid").toString();
  	Enumeration<String> en = request.getParameterNames();
	DBProcess dbProc = new DBProcess();
	int ret = 0;
	while (en.hasMoreElements()) {
		String parameterName = (String) en.nextElement();
		String parameterValue = request.getParameter(parameterName);
		if(parameterName.contains("Generic")){
			ret += dbProc.genericResponseData(uid, parameterName, parameterValue);	
		} else {
			// arr[0] = testCaseID, arr[1] = ratingQuestionID
			String[] arr = parameterName.split("\\.");
			ret += dbProc.ratingResponseData(uid, gid, arr[0], arr[1], parameterValue);
		}
	}
	if (ret > 0) {
		String[] StateInfo = dbProc.updateState(uid,session.getAttribute("state").toString());
		session.setAttribute("state", StateInfo[0]);
	  	dbProc.disConnect();
	  	response.sendRedirect("../"+StateInfo[1]);
	} else {
		dbProc.disConnect();
	  	response.sendRedirect("../rateRequirements.jsp");
	}
%>