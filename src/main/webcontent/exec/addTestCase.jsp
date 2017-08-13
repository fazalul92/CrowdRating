<%@ page import="edu.rit.se.creativecrowd.DBProcess"%>
<%
  String rid = request.getParameter("requirementID");
  String uid = session.getAttribute("userid").toString();
  String gid = session.getAttribute("groupid").toString();
  String context1 = request.getParameter("context1");
  String stimulus1 = request.getParameter("stimuli1");
  String behavior1 = request.getParameter("behavior1");
  String context2 = request.getParameter("context2");
  String stimulus2 = request.getParameter("stimuli2");
  String behavior2 = request.getParameter("behavior2");
  DBProcess dbProc = new DBProcess();
  int ret = dbProc.addTestCase(rid, uid, gid, context1, stimulus1, behavior1);
  ret += dbProc.addTestCase(rid, uid, gid, context2, stimulus2, behavior2);
  if (ret > 1) {
		String[] StateInfo = dbProc.updateState(uid, session.getAttribute("state").toString());
		session.setAttribute("state", StateInfo[0]);
		dbProc.disConnect();
		response.sendRedirect("../" + StateInfo[1]);
  } else {
	dbProc.disConnect();
    response.sendRedirect("../addTestCase.jsp");
  }
%>