<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 1/3/2023
  Time: 7:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>
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
    <title>Edit</title>
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
                            Chỉnh sửa sản phẩm
                        </header>
                    </c:if>
                    <c:if test="${empty model.id}">
                        <header class="panel-heading">
                            Thêm sản phẩm
                        </header>
                    </c:if>
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-${alert}">
                                ${messageResponse}
                        </div>
                    </c:if>
                    <div class="panel-body">
                        <div class="position-center">
                            <form role="form" id="productSumitForm">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                                    <input type="text" name="name" class="form-control"
                                           id="name" value="${model.name}" placeholder="Tên sản phẩm">
                                </div>
                                <div class="form-group">
                                    <label for="price">Giá sản phẩm</label>
                                    <input type="number" name="price" id="price" class="form-control"
                                           value="${model.price}" placeholder="Giá sản phẩm">
                                </div>
                                <div class="form-group">
                                    <label for="description">Mô tả sản phẩm</label>
                                    <textarea rows="5" class="form-control" name="description" id="description"
                                              required>${model.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="status">Hiển thị</label>
                                    <select class="form-control input-sm m-bot15" name="status" id="status">
                                        <option value="1"
                                                <c:if test="${model.status == 1}">selected="selected"</c:if> >Hiển thị
                                        </option>
                                        <option value="0"
                                                <c:if test="${model.status == 0}">selected="selected"</c:if> >Ẩn
                                        </option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Danh mục</label>
                                    <select class="form-control input-sm m-bot15" name="categoryName" id="categoryName">
                                        <c:if test="${not empty model.id}">
                                            <option value="${model.categoryName}">${model.categoryName}</option>
                                        </c:if>
                                        <c:if test="${empty model.id}">
                                            <option value="">Chọn danh mục sản phẩm</option>
                                        </c:if>
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${item.name}">${item.name}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <c:if test="${not empty model.id}">
                                    <button type="submit" name="add_category_product" id="btnAddOrUpdateProduct"
                                            class="btn btn-info">Chỉnh sửa
                                    </button>
                                    <a href="<c:url value="${prURL}"/>" class="btn-danger btn">Hủy</a>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <button type="submit" name="add_category_product" id="btnAddOrUpdateProduct"
                                            class="btn btn-info">Tiếp tục</button>
                                </c:if>
                                <input type="hidden" value="${model.id}" id="id" name="id">
                            </form>
                        </div>

                    </div>
                </section>
            </div>
            <!-- footer -->
            <div class="footer">
                <div class="wthree-copyright">
                    <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
                </div>
            </div>
            <!-- / footer -->
        </section>
    </section>
    <!--main content end-->
</section>

<script>

    $('#btnAddOrUpdateProduct').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#productSumitForm').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        var id = $('#id').val();
        if (id == "") {
            addCategory(data);
        } else {
            updateCategory(data);
        }
    });

    function addCategory(data) {
        $.ajax({
            url: '${urlProductAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if (result.id != 0) {
                    window.location.href = "${urlProduct}?typeAction=continue&id=" + result.id +"&message=" + result.message;
                } else {
                    window.location.href = "${urlProduct}?typeAction=edit&message=" + result.message;
                }
            },
            error: function (error) {
                window.location.href = "${urlProduct}?typeAction=edit&message=error_system";
            }
        });
    }

    function updateCategory(data) {
        $.ajax({
            url: '${urlProductAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${urlProduct}?typeAction=list&message=update_success&page=1";
            },
            error: function (error) {
                window.location.href = "${urlProduct}?typeAction=edit&message=error_system";
            }
        });
    }
</script>
</body>
</html>
