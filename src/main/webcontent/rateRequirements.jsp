<%@ page import="java.sql.ResultSet"%>
<%@ page import="edu.rit.se.creativecrowd.DBProcess"%>
<%
   DBProcess dbProc = new DBProcess();
	ResultSet rs = dbProc.getTestCasesByGroupId(session.getAttribute("groupid").toString());
 	/* ResultSet rs = dbProc.getTestCasesByGroupId("40"); */
 	int i = 1;
 	String rid = request.getParameter("id");
 	/* ResultSet rs1 = dbProc.getRequirementByGroupId("40"); */
  	ResultSet rs1 = dbProc.getRequirementByGroupId(session.getAttribute("groupid").toString());
  	rs1.next();
  	
	ResultSet rs2 = null;
	
	String[] GenericQuestions = {"Which animal is larger -  an elephant or a horse:", "Horse", "Elephant", "How many days does a week have:", "Seven", "Eight", "Which country can be found North of United States:", "Argentina", "Canada", "Which is the largest planet in the solar system:", "Jupiter", "Mars"};
	int gencount = 0;
	int counter = 1;
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
							<h3></h3>
						</div>

					</div>
					<!--  Start Panel -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>High Level Use Case</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<%= rs1.getString("description") %>
							</div>
						</div>
					</div>
					
				<form class="form-horizontal form-label-left" method="post"
					id="rateRequirements" action="exec/rateRequirements.jsp">
					<% while(rs.next()) { 
						rs2 = dbProc.getQuestions("requirement_questions");
					 	if( counter==4 || counter==10 || counter==17 || counter==20 ) {%>
								
								
								<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Question
									<%= i++ %><small></small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
										<b></b></td><td><%= GenericQuestions[gencount*3] %>
							</div>
							<div class="x_content">
									<br />

										<table class="table" style="border: 0px;">
											<tbody>
												<tr>
													<th scope="row" style="width:10%;"><label class=""
														for="RatingGeneric<%= gencount %>">Answer
															<span class="required">
														</span></label></th>
													<td>
														
														<div style="width: 20%; float: left;">
															<input type="radio" name="RatingGeneric<%= gencount+1 %>"
																value="1"> <%= GenericQuestions[gencount*3+1]  %>
														</div> 
													</td>
													<td>
														
														<div style="width: 20%; float: left;">
															<input type="radio" name="RatingGeneric<%= gencount+1 %>"
																value="2"> <%= GenericQuestions[gencount*3+2]  %>
														</div> 
													</td>
												</tr>

											</tbody>
										</table>
									

								</div>
						</div>
					</div>
					<% 		
						counter++;
						gencount++;	                        
							                        
					 } %>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Requirement
									<%= i++ %><small></small>
								</h2>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<table style="width:100%;">
									<tr>
										<td style="width:10%;"><b>Stimulus</b></td><td><%= rs.getString("stimuli") %></td>
									</tr>
									<tr>
										<td style="width:10%;"><b>Context</b></td><td><%= rs.getString("context") %></td>
									</tr>
									<tr>
										<td style="width:10%;"><b>Behavior</b></td><td><%= rs.getString("behavior") %></td>
									</tr>
								</table>
							</div>
							<div class="x_content">
									<br />

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
													<th scope="row" style="width:10%;"><label class=""
														for="<%= rs2.getInt("id") %>"><%= rs2.getString("description") %>
															<span class="required"> <% if(rs2.getInt("required")==1){ out.println("*"); } %>
														</span></label></th>
													<td>
														<% for (int k = 0; k < choices.length; k++) { %>
														<div style="width: 20%; float: left;">
															<input type="radio" name="<%= rs.getInt("id") %>.<%= rs2.getInt("id") %>"
																value="<%= k+1 %>"
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
									



								</div>
						</div>
					</div>
					<!-- End Panel -->
					<% 
					counter++;
					} 
					%>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
								
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-10">
											<button class="btn btn-primary">Cancel</button>
											<button id="subm" class="btn btn-success">Submit</button>
										</div>
								
								<div class="clearfix"></div>
						</div>
					</div>
					</form>

				</div>

			</div>
		</div>
		<!-- /page content -->


		<%@ include file="scripts.jsp"%>
</body>
</html>

<% dbProc.disConnect(); %>