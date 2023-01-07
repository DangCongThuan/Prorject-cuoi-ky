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
  <title>Edit</title>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="<c:url value="/templates/uploadImage/dist/image-uploader.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/templates/uploadImage/dist/image-uploader.min.js"/>"></script>
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
              <form action="<c:url value="/UploadDownloadFileServlet"/>" method="POST" name="form-image" id="form-image" enctype="multipart/form-data">
                <input type="hidden" name="id" id="id" value="${model.id}">
                <div class="form-group">
                      <label for="input-images-0">Thumbnail</label>
                    <div class="input-images-0" style="padding-top: .5rem;"></div>
                  </div>
                  <div class="form-group">
                      <label class="active">Infor</label>
                      <div class="input-images-1" style="padding-top: .5rem;"></div>
                  </div>
                  <button class="btn btn-primary">Submit and display data</button>
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
    $(function(){
        $('.input-images-0').imageUploader({
          imagesInputName: 'thumbnail',
          preloadedInputName: 'preloaded-thumbnail',
          maxFiles: 1,
        });
        $('.input-images-1').imageUploader({
          imagesInputName: 'infor',
          preloadedInputName: 'preloaded-infor',
        });
    });
</script>

</body>
</html>
