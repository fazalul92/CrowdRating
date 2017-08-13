<!DOCTYPE html>
<html lang="en">
  <head>
  <%@ include file="head.jsp" %>
  </head>
  <%
  	DBProcess dbProc = new DBProcess();
  	ResultSet rs1 = dbProc.getRequirementByGroupId(session.getAttribute("groupid").toString());
  	rs1.next();
  %>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
		<%@ include file="menu.jsp" %>
		
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Add Requirement</h3>
              </div>

            </div>
            <div class="clearfix"></div>
            <div class="row">
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
            
            
            <form method="post" action="exec/addTestCase.jsp">
            
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Add Test Scenario 1<small></small></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content ">
                  <div id="alerts"></div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <input name="requirementID" type="hidden" value="<%= rs1.getInt("id") %>">
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="stimuli1" required id="stimuli1" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Stimulus" maxlength="500"></textarea>
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="context1" required id="context1" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Context" maxlength="500"></textarea>
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="behavior1" required id="behavior1" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Response" maxlength="500"></textarea>
                  </div>
                  
                </div>
                  
                  
                  <br />

                  <div class="ln_solid"></div>
                </div>
              </div>
            </div>
            
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Add Test Scenario 2<small></small></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content ">
                  <div id="alerts"></div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <input name="requirementID" type="hidden" value="<%= rs1.getInt("id") %>">
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="stimuli2" required id="stimuli2" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Stimulus" maxlength="500"></textarea>
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="context2" required id="context2" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Context" maxlength="500"></textarea>
                  </div>
                  
                </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                    <textarea name="behavior2" required id="behavior2" style="height:100px" class="col-md-12 col-sm-12 col-xs-12 form-group" placeholder="Response" maxlength="500"></textarea>
                  </div>
                  
                </div>
                  
                  
                  <br />

                  <div class="ln_solid"></div>
                </div>
              </div>
            </div>
            
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
          </div>
        </div>
        
        <!-- /page content -->

        
	<%@ include file="scripts.jsp" %>
  </body>
</html>