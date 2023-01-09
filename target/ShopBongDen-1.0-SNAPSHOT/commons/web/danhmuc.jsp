<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Danh mục</h2>
<div class="panel-group category-products" id="accordian1"><!--category-productsr-->
    <c:forEach var="item" items="${categories}">
            <div class="mainmenu">
                <ul style="padding-left: 5px;">
                    <li><a href="<c:url value="/danh-sach-san-pham?categoryName=${item.name}"/>">${item.name}</a></li>
                    <hr>
                </ul>
            </div>
    </c:forEach>
</div>
<!--/category-products-->
