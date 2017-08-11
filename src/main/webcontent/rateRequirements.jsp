<%@ page import="java.sql.ResultSet"%>
<%@ page import="edu.rit.se.creativecrowd.DBProcess"%>
<%
   DBProcess dbProc = new DBProcess();
	/* ResultSet rs = dbProc.getTestCasesByGroupId(session.getAttribute("groupid").toString()); */
 	ResultSet rs = dbProc.getTestCasesByGroupId("40");
 	int i = 1;
 	String rid = request.getParameter("id");
 	ResultSet rs1 = dbProc.getRequirementByGroupId("40");
  	/* ResultSet rs1 = dbProc.getRequirementByGroupId(session.getAttribute("groupid").toString()); */
  	rs1.next();
  	
	ResultSet rs2 = null;
 %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="head.jsp"%>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<%@ include file="menu.jsp"%>
			<!-- page content -->

			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Test Scenarios</h3>
						</div>

					</div>
					<!--  Start Panel -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Requirement</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<%= rs1.getString("description") %>
							</div>
						</div>
					</div>
					<% while(rs.next()) { 
						rs2 = dbProc.getQuestions("requirement_questions");
					%>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Testcase
									<%= i++ %><small></small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<b>Stimulus</b><br />
								<%= rs.getString("stimuli") %>
							</div>
							<div class="x_content">
								<b>Context</b><br />
								<%= rs.getString("context") %>
							</div>
							<div class="x_content">
								<b>Behavior</b><br />
								<%= rs.getString("behavior") %>
							</div>
							<div class="x_content">
									<br />

									<form class="form-horizontal form-label-left" method="post"
										id="postsurvey" action="exec/postsurvey.jsp">
										<table class="table" style="border: 0px;">
											<tbody>
												<%
												  while (rs2.next()) {
												    /* if (rs2.getInt("user_group_type") != 0
												        && (Integer.parseInt(session.getAttribute("group_type").
												            toString()) != rs2.getInt("user_group_type"))) {
												      continue;
												    } */
												%>
												<tr>
													<% if (rs2.getString("question_type").equals("text")) { %>
													<th scope="row"><label class=""
														for="<%= rs2.getInt("id") %>"><%= rs2.getString("description") %>
															<span class="required"> <% if(rs2.getInt("required")==1){ out.println("*"); } %>
														</span></label></th>
													<td><input type="text" id="<%= rs.getInt("id") %>.<%= rs2.getInt("id") %>"
														name="<%= rs2.getInt("id") %>"
														<% if(rs2.getInt("required")==1){ out.println("required"); } %>
														class="form-control"
														placeholder="<%= rs2.getString("answer_choices") %>"></td>
													<% } else if (rs2.getString("question_type").equals("multiple_choice")) { 
	                    		String answers = rs2.getString("answer_choices");
	                    		String[] choices = answers.split("\\|");
	                    	%>
													<th scope="row"><label class=""
														for="<%= rs2.getInt("id") %>"><%= rs2.getString("description") %>
															<span class="required"> <% if(rs2.getInt("required")==1){ out.println("*"); } %>
														</span></label></th>
													<td><select name="<%= rs2.getInt("id") %>"
														<% if(rs2.getInt("required")==1){ out.println("required"); } %>
														class="form-control">
															<option value=""></option>
															<% for (int j = 0; j < choices.length; j++) { %>

															<option value="<%= choices[j] %>"><%= choices[j] %></option>

															<% } %>
													</select></td>
													<% } else if (rs2.getString("question_type").equals("multiple_choice_radio")) { 
	                    		String answers = rs2.getString("answer_choices");
	                    		String[] choices = answers.split("\\|");
	                    	%>
													<th scope="row"><label class=""
														for="<%= rs2.getInt("id") %>"><%= rs2.getString("description") %>
															<span class="required"> <% if(rs2.getInt("required")==1){ out.println("*"); } %>
														</span></label></th>
													<td>
														<% for (int k = 0; k < choices.length; k++) { %>
														<div style="width: 20%; float: left;">
															<input type="radio" name="<%= rs.getInt("id") %>.<%= rs2.getInt("id") %>"
																value="<%= choices[k] %>"
																<% if(rs2.getInt("required")==1){ out.println("required"); } %>>
															<%= choices[k] %>
														</div> <% } %>
													</td>
													<% } else if (rs2.getString("question_type").equals("description")) { 
	                    	%>
													<th scope="row" colspan="2"><label class=""
														for="<%= rs2.getInt("id") %>"><h2
																style="color: #e82c2c;"><%= rs2.getString("description") %></h2>
															<span class="required"></span></label></th>

													<% } %>
												</tr>
												<% } %>

											</tbody>
										</table>
									</form>



								</div>
						</div>
					</div>
					<!-- End Panel -->
					<% } %>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
								
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-11">
											<button class="btn btn-primary">Cancel</button>
											<button id="subm" class="btn btn-success">Submit</button>
										</div>
								
								<div class="clearfix"></div>
						</div>
					</div>


				</div>

			</div>
		</div>
		<!-- /page content -->


		<%@ include file="scripts.jsp"%>
</body>
</html>

<% dbProc.disConnect(); %>