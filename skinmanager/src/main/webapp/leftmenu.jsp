<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <ul class="nav nav-pills nav-stacked custom-nav">
					<c:forEach items="${menuList}" var="one">
						<li class="menu-list nav-active"><a href="#" class="dropdown-toggle"> <i
								class="icon-home"></i> <span class="menu-text">
									${one.menuName } </span> <b class="arrow icon-angle-down"></b>
						</a>
							<ul class="sub-menu-list">
								<c:forEach items="${one.childMenuPojo}" var="two">
									<li ><a class="dropdown-toggle"
										dataUrl="${pageContext.request.contextPath }/${two.menuUrl}">
											<i class="icon-layers"></i> ${two.menuName} <b
											class="arrow icon-angle-down"></b>
									</a>
										<ul >
											<c:forEach items="${two.childMenuPojo}" var="three">
												<li class="active"><a style="color: #8E99AB"
													dataUrl="${pageContext.request.contextPath }/${three.menuUrl}">
														<i ></i> ${three.menuName}
												</a></li>
											</c:forEach>
										</ul></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul>
		
				