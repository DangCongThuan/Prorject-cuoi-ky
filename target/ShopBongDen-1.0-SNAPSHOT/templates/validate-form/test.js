
    $(function() {
    $("#form_register").validate({
        rules: {
            "username": {
                required: true,
                minlength: 6,
                maxlength: 12,
                alpha_numericRegex: true
            },
            "password": {
                required: true,
                minlength: 6,
                maxlength: 20,
            },
            "confirm_password": {
                required: true,
                minlength: 6,
                maxlength: 20,
                equalTo: password,
            },
            "email": {
                required: true,
                maxlength: 200,
                email: true
            },
            "contact": {
                required: true,
                minlength: 10,
                maxlength: 12,
                numericRegex: true
            }
        },
        messages: {
            "username": {
                required: "Vui lòng điền tên đăng nhập",
                minlength: "Vui lòng nhập ít nhất {0} ký tự",
                maxlength: "Vui lòng nhập tối đa {0} ký tự",
                alpha_numericRegex:"Chỉ nhập ký tự chữ và số"
            },
            "password": {
                required: "Vui lòng điền mật khẩu",
                minlength: "Vui lòng nhập ít nhất {0} ký tự",
                maxlength: "Vui lòng nhập tối đa {0} ký tự"
            },
            "confirm_password": {
                required: "Vui lòng điền xác nhận mật khẩu",
                minlength: "Vui lòng nhập ít nhất {0} ký tự",
                maxlength: "Vui lòng nhập tối đa {0} ký tự",
                equalTo: "Mật khẩu xác nhận phải trùng khớp với mật khẩu"
            },
            "email": {
                required: "Vui lòng điền email",
                maxlength: "Vui lòng nhập tối đa {0} ký tự",
                email: "Vui lòng điền email hợp lệ, ví dụ: example@mailinator.com",
            },
            "contact": {
                required: "Vui lòng điền thông tin liên hệ",
                minlength: "Vui lòng nhập ít nhất {0} ký tự",
                maxlength: "Vui lòng nhập tối đa {0} ký tự",
                numericRegex:"Chỉ được phép nhập số"
            }
        },
        submitHandler: function() {
            $.ajax( {
                type: "POST",
                url: 'https://hantinhcongnghe.com/ajaxData/proc_register',
                data: $("#form_register").serialize(),
                success: function(data)
                {
                    if (data.errCode == "0") {
                        alert("Đăng ký thành công");
                        window.open('https://hantinhcongnghe.com/index', '_parent');
                    }else{
                        alert(data.errCode + " - " + data.errMsg);
                        window.open('https://hantinhcongnghe.com', '_parent');
                    }
                }
            });
        }
    });
});
    $.validator.addMethod("numericRegex", function (value, element) {
    return this.optional(element) || /^[0-9\-]+$/i.test(value);
});
    $.validator.addMethod("alpha_numericRegex", function (value, element) {
    return this.optional(element) || /^[a-z0-9\-]+$/i.test(value);
});
