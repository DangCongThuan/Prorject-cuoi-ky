<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/3/2023
  Time: 7:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp"%>
<c:url var="urlProductAPI" value="/api-product"/>
<c:url var="urlProduct" value="/admin-san-pham"/>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
  <title>Danh sách sản phẩm</title>
  <script type="text/javascript" src="<c:url value='/templates/paging/jquery.twbsPagination.js' />"></script>
</head>
<body>
<section id="container">
  <!--sidebar end-->
  <!--main content start-->
  <section id="main-content">
    <section class="wrapper">
      <div class="table-agile-info">
        <div class="panel panel-default">
          <div class="panel-heading">
            Liệt kê sản phẩm
          </div>
          <div class="row w3-res-tb">
            <div class="col-sm-5 m-b-xs">
              <select class="input-sm form-control w-sm inline v-middle">
                <option value="0">Tác vụ</option>
                <option value="1">Xóa mục đã chọn</option>
                <option value="2">Chỉnh sửa hàng loạt</option>

              </select>
              <button id="btnDeleteProduct" class="btn btn-danger" type="button" data-toggle="tooltip" title="xóa"><span><i class="fa fa-trash-o bigger-110 pink"></i></span>
              </button>
            </div>
            <div class="col-sm-4">
            </div>
            <div class="col-sm-3">
              <div class="input-group">
                <input type="text" class="input-sm form-control" placeholder="Search">
                <span class="input-group-btn">
            <button class="btn btn-sm btn-default" type="button">Tìm kiếm</button>
          </span>
              </div>
            </div>
          </div>
          <div class="table-responsive">
            <table class="table table-striped b-t b-light">
              <thead>
              <tr>
                <th style="width:20px;">
                  <label class="i-checks m-b-none">
                    <input id="checkAll" class="check" type="checkbox"><i></i>
                  </label>
                </th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
                <th>Hình sản phẩm</th>
                <th>Danh mục</th>
                <th>Hiển thị</th>
                <th style="width:30px;"></th>
              </tr>
              </thead>
              <tbody>

              <c:forEach var="item" items="${model.listResult}">

              <tr>
                <td><label class="i-checks m-b-none"><input type="checkbox"
                id="checkbox_${item.id}" value="${item.id}" class="check"><i></i></label></td>
                <td>${item.name}</td>
                <td><span class="text-ellipsis">${item.price} đ</span></td>
                <td><span class="text-ellipsis"><img style="width: 50px; height: 50px;" height="50px" src="<c:url value="/UploadDownloadFileServlet?fileName=${item.thumbnail}"/>">  </span></td>
                <td><span class="text-ellipsis">${item.categoryModel.name}</span></td>
                <c:if test="${item.status == 1}">
                <td><span class="text-ellipsis">Có</span></td>
                </c:if>
                <c:if test="${item.status == 0}">
                  <td><span class="text-ellipsis">Ẩn</span></td>
                </c:if>
                <td>
                  <c:url var="editURL" value="/admin-san-pham">
                    <c:param name="typeAction" value="edit"/>
                    <c:param name="id" value="${item.id}"/>
                  </c:url>
                  <a href="${editURL}" class="active"><i class="fa fa-pencil-square-o text-success text-active"></i></a>
                </td>
              </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
          <footer class="panel-footer">
            <div class="row">

              <div class="col-sm-5 text-center">
<%--                <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of ${model.totalItems} items</small>--%>
              </div>
              <div class="col-sm-7 text-right text-center-xs">
                <form action="<c:url value="/admin-san-pham"/>" id="pageChange" method="get">
                  <div class="text-center"  aria-label="Page navigation">
                    <ul class="pagination" id="pagination"></ul>
                  </div>
                  <input type="hidden" value="" id="page" name="page">
                  <input type="hidden" value="" id="maxPageItems" name="maxPageItems">
                  <input type="hidden" value="" id="sortName" name="sortName">
                  <input type="hidden" value="" id="sortBy" name="sortBy">
                  <input type="hidden" value="" id="typeAction" name="typeAction">


                </form>
<%--                <ul class="pagination pagination-sm m-t-none m-b-none">--%>
<%--                  <li><a href=""><i class="fa fa-chevron-left"></i></a></li>--%>
<%--                  <li><a href="">1</a></li>--%>
<%--                  <li><a href="">2</a></li>--%>
<%--                  <li><a href="">3</a></li>--%>
<%--                  <li><a href="">4</a></li>--%>
<%--                  <li><a href=""><i class="fa fa-chevron-right"></i></a></li>--%>
<%--                </ul>--%>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </section>
    <!-- footer -->
    <div class="footer">
      <div class="wthree-copyright">
        <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
      </div>
    </div>
    <!-- / footer -->
  </section>

  <!--main content end-->
</section>
<script>
  var totalPages = Number('${model.totalPages}');
  var currentPage = Number('${model.page}');
  var limit = 9;
  <%--var totalPages = Number('${model.page}');--%>

  // var currentPage = 0;
  $(function () {
    window.pagObj = $('#pagination').twbsPagination({
      totalPages: totalPages,
      visiblePages: 5,
      startPage: currentPage,
      onPageClick: function (event, page) {
        if (currentPage != page) {
          $('#page').val(page);
          $('#maxPageItems').val(limit);
          $('#sortBy').val('desc');
          $('#sortName').val("price");
          $('#typeAction').val("list");
          $('#pageChange').submit();
        }

      }
    });
  });
  $("#checkAll").click(function () {
    $(".check").prop('checked', $(this).prop('checked'));
  });

  $("#btnDeleteProduct").click(function() {
    var data = {};
    var ids = $('tbody input[type=checkbox]:checked').map(function () {
      return $(this).val();
    }).get();
    data['ids'] = ids;
    deleteProduct(data);
  });
  function deleteProduct(data) {

    $.ajax({
      url: '${urlProductAPI}',
      type: 'DELETE',
      contentType: 'application/json',
      data: JSON.stringify(data),
      success: function (result) {
        window.location.href = "${urlProduct}?typeAction=list&page=1&sortName=${model.sortName}&sortBy=${model.sortBy}";
      },
      error: function (error) {
        window.location.href = "${urlProduct}?typeAction=list&page=1&sortName=${model.sortName}sortBy=${model.sortBy}";
      }
    });
  }
</script>
</body>
</html>
