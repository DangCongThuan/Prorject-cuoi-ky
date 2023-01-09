<%--
  Created by IntelliJ IDEA.
  User: Pc
  Date: 15/11/2022
  Time: 1:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/commons/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Giỏ Hàng | LIGHT</title>

</head><!--/head-->

<body>


<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Trang Chủ</a></li>
                <li class="active">Giỏ Hàng</li>
            </ol>
        </div><!--/breadcrums-->


        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">Sản phẩm </td>
                    <td class="description"></td>
                    <td class="price">Giá</td>
                    <td class="quantity">Số lượng</td>
                    <td class="total">Tạm tính</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="cart_product">
                        <a href=""><img src="<c:url value = "/templates/web/images/cart/img.png" />" alt=""></a>
                    </td>
                    <td class="cart_description">
                        <h5><a href="">Đèn led chống cháy nổ F8235</a></h5>
                    </td>
                    <td class="cart_price">
                        <p>180.000</p>
                    </td>
                    <td class="cart_quantity">
                        <div class="cart_quantity_button">
                            <a class="cart_quantity_up" href=""> + </a>
                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                            <a class="cart_quantity_down" href=""> - </a>
                        </div>
                    </td>
                    <td class="cart_total">
                        <p class="cart_total_price">180.000</p>
                    </td>
                    <td class="cart_delete">
                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                    </td>
                </tr>

                <tr>
                    <td class="cart_product">
                        <a href=""><img src="<c:url value = "/templates/web/images/cart/img_1.png" />" alt=""></a>
                    </td>
                    <td class="cart_description">
                        <h5><a href="">Đèn led nhà xương UFO 50w</a></h5>
                    </td>
                    <td class="cart_price">
                        <p>150.000</p>
                    </td>
                    <td class="cart_quantity">
                        <div class="cart_quantity_button">
                            <a class="cart_quantity_up" href=""> + </a>
                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                            <a class="cart_quantity_down" href=""> - </a>
                        </div>
                    </td>
                    <td class="cart_total">
                        <p class="cart_total_price">150.000</p>
                    </td>
                    <td class="cart_delete">
                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="cart_product">
                        <a href=""><img src="<c:url value = "/templates/web/images/cart/img_2.png" />" alt=""></a>
                    </td>
                    <td class="cart_description">
                        <h5><a href="">Đèn led pha HDFL02 250w</a></h5>
                    </td>
                    <td class="cart_price">
                        <p>200.000</p>
                    </td>
                    <td class="cart_quantity">
                        <div class="cart_quantity_button">
                            <a class="cart_quantity_up" href=""> + </a>
                            <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                            <a class="cart_quantity_down" href=""> - </a>
                        </div>
                    </td>
                    <td class="cart_total">
                        <p class="cart_total_price">200.000</p>
                    </td>
                    <td class="cart_delete">
                        <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</section> <!--/#cart_items-->



</body>
</html>