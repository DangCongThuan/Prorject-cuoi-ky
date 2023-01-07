<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/3/2023
  Time: 7:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
<c:url var="urlCategoryAPI" value="/api-category"/>
<c:url var="urlCategory" value="/admin-danh-muc"/>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
    <c:if test="${not empty model.id}">
    <title>Chỉnh sửa danh mục</title>
    </c:if>
    <c:if test="${empty model.id}">
        <title>Thêm danh mục</title>
    </c:if>
</head>
<body>
<section id="container">



    <!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div class="col-lg-12">
                <section class="panel">
                    <c:if test="${not empty model.id}">
                        <header class="panel-heading">
                            Chỉnh sửa danh mục
                        </header>
                    </c:if>
                    <c:if test="${empty model.id}">
                        <header class="panel-heading">
                            Thêm danh mục
                        </header>
                    </c:if>
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-${alert}">
                                ${messageResponse}
                        </div>
                    </c:if>
                    <div class="panel-body">
                        <div class="position-center">
                            <form id="formSubmit">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên danh mục</label>
                                    <input type="text" name="name" class="form-control"
                                           id="name" value="${model.name}" required>
                                </div>
                                <div class="form-group">
                                    <label for="description">Mô tả danh mục</label>
                                    <textarea  rows="5" class="form-control" name="description" id="description" required>${model.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="status">Hiển thị</label>
                                    <select class="form-control input-sm m-bot15" name="status" id="status">
                                        <option value="1" <c:if test="${model.status == 1}">selected="selected"</c:if> >Hiển thị</option>
                                        <option value="0" <c:if test="${model.status == 0}">selected="selected"</c:if> >Ẩn</option>
                                    </select>
                                </div>
                                <c:if test="${not empty model.id}">
                                    <button type="submit" name="add_category_product" id="btnAddOrUpdateCategory" class="btn btn-info">Chỉnh sửa</button>

                                    <a href="<c:url value="${prURL}"/>" class="btn-danger btn">Hủy</a>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button type="submit" name="add_category_product" id="btnAddOrUpdateCategory" class="btn btn-info">Thêm</button>
                                </c:if>
                                <input type="hidden" value="${model.id}" id="id" name="id">

                            </form>
                        </div>

                    </div>
                </section>
                <!-- footer -->
                <div class="footer">
                    <div class="wthree-copyright">
                        <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a>
                        </p>
                    </div>
                </div>
                <!-- / footer -->
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
<script>
    $('#btnAddOrUpdateCategory').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        var id = $('#id').val();
        if (id == "") {
            addCategory(data);
        }else {
            updateCategory(data);
        }
    });
    function addCategory(data) {
        $.ajax({
            url: '${urlCategoryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${urlCategory}?typeAction=edit&message="+result.message;
            },
            error: function (result) {
                window.location.href = "${urlCategory}?typeAction=edit&message=system_error";

            }
        });
    }
    function updateCategory(data) {
        $.ajax({
            url: '${urlCategoryAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${urlCategory}?typeAction=list&message=update_success&page=1";
            },
            error: function (error) {
                window.location.href = "${urlCategory}?typeAction=edit&message=error_system";
            }
        });
    }
</script>
</body>
</html>
