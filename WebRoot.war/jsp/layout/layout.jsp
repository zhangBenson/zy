<%@ page language="java" pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
%>



		<TABLE cellSpacing=0 cellPadding=0  width="80%" align=center
			  border=0>
			<tr>
				<td>
					<tiles:get name="contentheader"/>
				</td>
			</tr>
		</TABLE>

		<TABLE cellSpacing=0 cellPadding=0 width="80%"  align=center
			 border=0>
				<TR>
					<TD vAlign=top width="20%" height=314>

						<table  width="100%" >
							<tr>
								<td>
									<tiles:get name="contentLeft"/>
								</td>
							</tr>
						</table>

					</TD>
					<TD vAlign=top width="80%" >
						<table width="100%">
							<tr>
								<td width="100%">
									<tiles:get name="contentRight"/>
								</td>
							</tr>
						</table>
					</TD>
				</TR>
		</TABLE>
		
